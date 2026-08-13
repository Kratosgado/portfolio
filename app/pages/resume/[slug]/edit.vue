<script setup lang="ts">
const route = useRoute()
const slug = route.params.slug as string

const [{ data: resumeData }, { data: projectsData }] = await Promise.all([
  useAsyncData(`resume-edit-${slug}`, () =>
    queryCollection('resumes').where('slug', '==', slug).first()
  ),
  useAsyncData('all-projects-builder', () =>
    queryCollection('projects').order('rank', 'ASC').all()
  ),
])

if (!resumeData.value) {
  throw createError({ statusCode: 404, statusMessage: 'Resume not found' })
}

useSeoMeta({ title: `Edit – ${resumeData.value.title}` })

function clone<T>(v: T): T {
  return JSON.parse(JSON.stringify(v))
}

type Link = { label: string; url: string }
type ResumeProject = {
  toolRef?: string
  name: string
  year: string
  links: Link[]
  bullets: string[]
}

const liveUrlLabel: Record<string, string> = {
  'vscode-extension': 'VS Code Marketplace',
  'neovim-plugin': 'Neovim',
  'intellij-plugin': 'JetBrains Marketplace',
  'cli': 'Install',
  'library': 'Package',
}

function projectLinks(proj: NonNullable<typeof projectsData.value>[number]): Link[] {
  const links: Link[] = []
  if (proj.liveUrl) links.push({ label: liveUrlLabel[proj.toolType ?? ''] ?? 'Live URL', url: proj.liveUrl })
  if (proj.github) links.push({ label: 'GitHub', url: proj.github })
  return links
}

function installSuffix(installs?: number) {
  if (!installs) return ''
  return ` (${installs >= 1000 ? `${+(installs / 1000).toFixed(1)}k+` : installs} installs)`
}

const form = reactive({
  slug: resumeData.value.slug,
  title: resumeData.value.title,
  targetRole: resumeData.value.targetRole ?? '',
  header: clone(resumeData.value.header ?? { name: '', links: [] }),
  profile: resumeData.value.profile ?? '',
  education: clone(resumeData.value.education ?? []),
  skills: clone(resumeData.value.skills ?? []).map((s: { category: string; items: string[] }) => ({
    ...s,
    itemsText: (s.items ?? []).join(', '),
  })),
  experience: clone(resumeData.value.experience ?? []),
  projects: (resumeData.value.projects ?? []).map((p) => ({
    toolRef: p.toolRef ?? undefined,
    name: p.name ?? '',
    year: p.year ?? '',
    links: clone(p.links ?? []),
    bullets: clone(p.bullets ?? []),
  })) as ResumeProject[],
})

function resolvedName(p: ResumeProject) {
  if (p.toolRef) {
    const proj = projectsData.value?.find((pr) => pr.slug === p.toolRef)
    if (proj) return proj.title + installSuffix(proj.installs)
  }
  return p.name
}

function resolvedLinks(p: ResumeProject): Link[] {
  if (p.toolRef) {
    const proj = projectsData.value?.find((pr) => pr.slug === p.toolRef)
    if (proj) return projectLinks(proj)
  }
  return p.links
}

// ── Project picker ──────────────────────────────────────────────
const pickerTitle = ref<string | undefined>(undefined)
const projectOptions = computed(() => (projectsData.value ?? []).map((p) => p.title))

function addFromPortfolio() {
  if (!pickerTitle.value) return
  const proj = projectsData.value?.find((p) => p.title === pickerTitle.value)
  if (!proj) return
  form.projects.push({
    toolRef: proj.slug ?? undefined,
    name: '',
    year: proj.year ?? '',
    links: [],
    bullets: clone(proj.resumeBullets ?? []),
  })
  pickerTitle.value = undefined
}

function addCustomProject() {
  form.projects.push({ name: '', year: '', links: [{ label: '', url: '' }], bullets: [''] })
}

function removeProject(i: number) { form.projects.splice(i, 1) }
function addBullet(proj: ResumeProject) { proj.bullets.push('') }
function removeBullet(proj: ResumeProject, i: number) { proj.bullets.splice(i, 1) }

// ── Custom project links ────────────────────────────────────────
function addCustomLink(proj: ResumeProject) { proj.links.push({ label: '', url: '' }) }
function removeCustomLink(proj: ResumeProject, i: number) { proj.links.splice(i, 1) }

// ── Experience ──────────────────────────────────────────────────
function addExperience() {
  form.experience.push({ company: '', role: '', period: '', location: '', url: '', bullets: [''] })
}
function removeExperience(i: number) { form.experience.splice(i, 1) }
function addExpBullet(exp: (typeof form.experience)[number]) { exp.bullets.push('') }
function removeExpBullet(exp: (typeof form.experience)[number], i: number) { exp.bullets.splice(i, 1) }

// ── Education ───────────────────────────────────────────────────
function addEducation() {
  form.education.push({ institution: '', degree: '', period: '', bullets: [] })
}
function removeEducation(i: number) { form.education.splice(i, 1) }

// ── Skills ──────────────────────────────────────────────────────
function addSkill() { form.skills.push({ category: '', items: [], itemsText: '' }) }
function removeSkill(i: number) { form.skills.splice(i, 1) }

// ── Header links ────────────────────────────────────────────────
function addHeaderLink() { form.header.links.push({ label: '', url: '' }) }
function removeHeaderLink(i: number) { form.header.links.splice(i, 1) }

// ── Export ──────────────────────────────────────────────────────
function buildJson() {
  return {
    slug: form.slug,
    title: form.title,
    ...(form.targetRole ? { targetRole: form.targetRole } : {}),
    header: form.header,
    profile: form.profile,
    education: form.education,
    skills: form.skills.map((s) => ({
      category: s.category,
      items: s.itemsText.split(',').map((i: string) => i.trim()).filter(Boolean),
    })),
    experience: form.experience.map((e) => ({
      company: e.company,
      role: e.role,
      period: e.period,
      location: e.location,
      ...(e.url ? { url: e.url } : {}),
      bullets: e.bullets.filter((b: string) => b.trim()),
    })),
    projects: form.projects.map((p) => ({
      ...(p.toolRef ? { toolRef: p.toolRef } : { name: p.name, ...(p.year ? { year: p.year } : {}), links: p.links }),
      bullets: p.bullets.filter((b) => b.trim()),
    })),
  }
}

const copied = ref(false)
async function copyJson() {
  await navigator.clipboard.writeText(JSON.stringify(buildJson(), null, 2))
  copied.value = true
  setTimeout(() => (copied.value = false), 2000)
}

function downloadJson() {
  const blob = new Blob([JSON.stringify(buildJson(), null, 2)], { type: 'application/json' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = `${form.slug}.json`
  a.click()
  URL.revokeObjectURL(url)
}
</script>

<template>
  <div class="max-w-3xl mx-auto px-6 py-8 space-y-10">
    <div class="flex items-center justify-between gap-4 flex-wrap">
      <div class="flex items-center gap-3">
        <UButton :to="`/resume/${slug}`" variant="ghost" icon="i-lucide-arrow-left" color="neutral" />
        <h1 class="text-xl font-bold">Resume Builder</h1>
      </div>
      <div class="flex gap-2">
        <UButton
          :icon="copied ? 'i-lucide-check' : 'i-lucide-clipboard'"
          color="neutral"
          variant="outline"
          @click="copyJson"
        >
          {{ copied ? 'Copied!' : 'Copy JSON' }}
        </UButton>
        <UButton icon="i-lucide-download" @click="downloadJson">
          Download JSON
        </UButton>
      </div>
    </div>

    <p class="text-sm text-muted -mt-6">
      Edit your resume here, then download the JSON and save it to
      <code class="bg-muted px-1 rounded">content/resumes/{{ slug }}.json</code> to publish.
    </p>

    <!-- Basic Info -->
    <section class="space-y-4">
      <h2 class="font-semibold text-base border-b pb-1">Basic Info</h2>
      <div class="grid sm:grid-cols-2 gap-4">
        <UFormField label="Slug">
          <UInput v-model="form.slug" placeholder="backend-engineer" class="w-full" />
        </UFormField>
        <UFormField label="Title">
          <UInput v-model="form.title" placeholder="Software Engineer" class="w-full" />
        </UFormField>
        <UFormField label="Target Role" class="sm:col-span-2">
          <UInput v-model="form.targetRole" placeholder="e.g. Backend Engineer at Google" class="w-full" />
        </UFormField>
      </div>
    </section>

    <!-- Header -->
    <section class="space-y-4">
      <h2 class="font-semibold text-base border-b pb-1">Header</h2>
      <UFormField label="Full Name">
        <UInput v-model="form.header.name" placeholder="Essilfie Prince Mbeah" class="w-full" />
      </UFormField>
      <div class="space-y-2">
        <p class="text-sm font-medium">Links</p>
        <div v-for="(link, i) in form.header.links" :key="i" class="flex gap-2 items-center">
          <UInput v-model="link.label" placeholder="Label" class="w-32 shrink-0" />
          <UInput v-model="link.url" placeholder="https://..." class="flex-1" />
          <UButton icon="i-lucide-x" color="neutral" variant="ghost" size="xs" @click="removeHeaderLink(i)" />
        </div>
        <UButton size="xs" variant="outline" icon="i-lucide-plus" @click="addHeaderLink">Add Link</UButton>
      </div>
    </section>

    <!-- Profile -->
    <section class="space-y-3">
      <h2 class="font-semibold text-base border-b pb-1">Profile</h2>
      <UTextarea v-model="form.profile" :rows="4" placeholder="Backend-focused full-stack engineer..." class="w-full" />
    </section>

    <!-- Education -->
    <section class="space-y-4">
      <h2 class="font-semibold text-base border-b pb-1">Education</h2>
      <div v-for="(edu, i) in form.education" :key="i" class="border rounded-lg p-4 space-y-3 relative">
        <UButton
          icon="i-lucide-x" color="neutral" variant="ghost" size="xs"
          class="absolute top-2 right-2"
          @click="removeEducation(i)"
        />
        <div class="grid sm:grid-cols-2 gap-3">
          <UFormField label="Institution">
            <UInput v-model="edu.institution" class="w-full" />
          </UFormField>
          <UFormField label="Period">
            <UInput v-model="edu.period" placeholder="Nov 2021 – Nov 2025" class="w-full" />
          </UFormField>
        </div>
        <UFormField label="Degree / Description">
          <UInput v-model="edu.degree" class="w-full" />
        </UFormField>
      </div>
      <UButton size="xs" variant="outline" icon="i-lucide-plus" @click="addEducation">Add Education</UButton>
    </section>

    <!-- Skills -->
    <section class="space-y-4">
      <h2 class="font-semibold text-base border-b pb-1">Skills</h2>
      <div v-for="(skill, i) in form.skills" :key="i" class="flex gap-3 items-start">
        <UInput v-model="skill.category" placeholder="Core Expertise" class="w-40 shrink-0" />
        <UInput v-model="skill.itemsText" placeholder="Rust, TypeScript, Go (comma-separated)" class="flex-1" />
        <UButton icon="i-lucide-x" color="neutral" variant="ghost" size="xs" @click="removeSkill(i)" />
      </div>
      <UButton size="xs" variant="outline" icon="i-lucide-plus" @click="addSkill">Add Category</UButton>
    </section>

    <!-- Experience -->
    <section class="space-y-4">
      <h2 class="font-semibold text-base border-b pb-1">Work Experience</h2>
      <div v-for="(exp, i) in form.experience" :key="i" class="border rounded-lg p-4 space-y-3 relative">
        <UButton
          icon="i-lucide-x" color="neutral" variant="ghost" size="xs"
          class="absolute top-2 right-2"
          @click="removeExperience(i)"
        />
        <div class="grid sm:grid-cols-2 gap-3">
          <UFormField label="Company">
            <UInput v-model="exp.company" class="w-full" />
          </UFormField>
          <UFormField label="Period">
            <UInput v-model="exp.period" placeholder="Nov 2025 – Present" class="w-full" />
          </UFormField>
          <UFormField label="Role">
            <UInput v-model="exp.role" class="w-full" />
          </UFormField>
          <UFormField label="Location">
            <UInput v-model="exp.location" class="w-full" />
          </UFormField>
          <UFormField label="Live URL (optional)" class="sm:col-span-2">
            <UInput v-model="exp.url" placeholder="https://..." class="w-full" />
          </UFormField>
        </div>
        <div class="space-y-2">
          <p class="text-sm font-medium">Bullets</p>
          <div v-for="(_, j) in exp.bullets" :key="j" class="flex gap-2 items-start">
            <UTextarea v-model="exp.bullets[j]" :rows="2" class="flex-1" />
            <UButton icon="i-lucide-x" color="neutral" variant="ghost" size="xs" @click="removeExpBullet(exp, j)" />
          </div>
          <UButton size="xs" variant="outline" icon="i-lucide-plus" @click="addExpBullet(exp)">Add Bullet</UButton>
        </div>
      </div>
      <UButton size="xs" variant="outline" icon="i-lucide-plus" @click="addExperience">Add Experience</UButton>
    </section>

    <!-- Projects -->
    <section class="space-y-4">
      <h2 class="font-semibold text-base border-b pb-1">Projects</h2>

      <div v-for="(proj, i) in form.projects" :key="i" class="border rounded-lg p-4 space-y-3 relative">
        <UButton
          icon="i-lucide-x" color="neutral" variant="ghost" size="xs"
          class="absolute top-2 right-2"
          @click="removeProject(i)"
        />

        <!-- Project from portfolio (toolRef) -->
        <div v-if="proj.toolRef" class="space-y-3">
          <div class="flex items-start justify-between gap-2 flex-wrap">
            <div>
              <p class="font-semibold text-sm">{{ resolvedName(proj) }}</p>
              <div class="flex gap-2 mt-1 flex-wrap">
                <a
                  v-for="link in resolvedLinks(proj)"
                  :key="link.label"
                  :href="link.url"
                  target="_blank"
                  class="text-xs text-blue-600 underline"
                >{{ link.label }}</a>
              </div>
            </div>
            <UBadge color="primary" variant="subtle" size="xs">From Portfolio</UBadge>
          </div>
        </div>

        <!-- Custom project -->
        <div v-else class="grid sm:grid-cols-2 gap-3">
          <UFormField label="Project Name">
            <UInput v-model="proj.name" class="w-full" />
          </UFormField>
          <UFormField label="Year">
            <UInput v-model="proj.year" placeholder="2024" class="w-full" />
          </UFormField>
          <div class="sm:col-span-2 space-y-2">
            <p class="text-sm font-medium">Links</p>
            <div v-for="(link, j) in proj.links" :key="j" class="flex gap-2 items-center">
              <UInput v-model="link.label" placeholder="Label" class="w-32 shrink-0" />
              <UInput v-model="link.url" placeholder="https://..." class="flex-1" />
              <UButton icon="i-lucide-x" color="neutral" variant="ghost" size="xs" @click="removeCustomLink(proj, j)" />
            </div>
            <UButton size="xs" variant="outline" icon="i-lucide-plus" @click="addCustomLink(proj)">Add Link</UButton>
          </div>
        </div>

        <!-- Bullets (editable for all project types) -->
        <div class="space-y-2">
          <p class="text-sm font-medium">Bullets</p>
          <div v-for="(_, j) in proj.bullets" :key="j" class="flex gap-2 items-start">
            <UTextarea v-model="proj.bullets[j]" :rows="2" class="flex-1" />
            <UButton icon="i-lucide-x" color="neutral" variant="ghost" size="xs" @click="removeBullet(proj, j)" />
          </div>
          <UButton size="xs" variant="outline" icon="i-lucide-plus" @click="addBullet(proj)">Add Bullet</UButton>
        </div>
      </div>

      <!-- Add project controls -->
      <div class="flex gap-2 items-center flex-wrap">
        <USelectMenu
          v-model="pickerTitle"
          :items="projectOptions"
          placeholder="Pick a portfolio project…"
          searchable
          class="w-64"
        />
        <UButton :disabled="!pickerTitle" icon="i-lucide-plus" variant="soft" @click="addFromPortfolio">
          Add from Portfolio
        </UButton>
        <UButton icon="i-lucide-pencil" color="neutral" variant="outline" @click="addCustomProject">
          Add Custom
        </UButton>
      </div>
    </section>

    <!-- Bottom actions -->
    <div class="flex justify-end gap-3 pt-4 border-t">
      <UButton
        :icon="copied ? 'i-lucide-check' : 'i-lucide-clipboard'"
        color="neutral"
        variant="outline"
        @click="copyJson"
      >
        {{ copied ? 'Copied!' : 'Copy JSON' }}
      </UButton>
      <UButton icon="i-lucide-download" @click="downloadJson">
        Download JSON
      </UButton>
    </div>
  </div>
</template>

<script setup lang="ts">
const route = useRoute()
const slug = route.params.slug as string

const [{ data: resume }, { data: allProjects }] = await Promise.all([
  useAsyncData(`resume-${slug}`, () =>
    queryCollection('resumes').where('slug', '==', slug).first()
  ),
  useAsyncData('projects-for-resume', () =>
    queryCollection('projects').all()
  ),
])

if (!resume.value) {
  throw createError({ statusCode: 404, statusMessage: 'Resume not found' })
}

const liveUrlLabel: Record<string, string> = {
  'vscode-extension': 'VS Code Marketplace',
  'neovim-plugin': 'Neovim',
  'intellij-plugin': 'JetBrains Marketplace',
  'cli': 'Install',
  'library': 'Package',
}

const resolvedResume = computed(() => {
  if (!resume.value) return null
  return {
    ...resume.value,
    projects: resume.value.projects.map((p) => {
      if (p.toolRef) {
        const proj = allProjects.value?.find((pr) => pr.slug === p.toolRef)
        if (proj) {
          const installSuffix = proj.installs
            ? ` (${proj.installs >= 1000 ? `${+(proj.installs / 1000).toFixed(1)}k+` : proj.installs} installs)`
            : ''
          const links = []
          if (proj.liveUrl) links.push({ label: liveUrlLabel[proj.toolType ?? ''] ?? 'Live URL', url: proj.liveUrl })
          if (proj.github) links.push({ label: 'GitHub', url: proj.github })
          return { name: proj.title + installSuffix, year: proj.year, links, bullets: p.bullets }
        }
      }
      return { name: p.name ?? '', year: p.year, links: p.links, bullets: p.bullets }
    }),
  }
})

useSeoMeta({
  title: `${resume.value.header.name} – ${resume.value.title}`,
  description: resume.value.profile.slice(0, 160),
})

useHead({
  link: [
    { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
    { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
    { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap' },
  ],
})

function print() {
  window.print()
}
</script>

<template>
  <div v-if="resolvedResume">
    <div class="no-print flex items-center justify-between max-w-[780px] mx-auto px-8 py-4 gap-4">
      <UButton to="/resume" variant="ghost" icon="i-lucide-arrow-left" color="neutral">
        All Resumes
      </UButton>
      <div class="flex gap-2">
        <UButton :to="`/resume/${slug}/edit`" color="neutral" variant="outline" icon="i-lucide-pencil">
          Edit
        </UButton>
        <UButton icon="i-lucide-printer" @click="print">
          Print / Save PDF
        </UButton>
      </div>
    </div>

    <ResumeDocument :resume="resolvedResume" />
  </div>
</template>

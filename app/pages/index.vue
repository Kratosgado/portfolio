<script setup lang="ts">
import type { ButtonProps } from '@nuxt/ui';

const { data: profile } = await useProfile();
const { data: projectsData } = await useAsyncData('projects', () =>
  queryCollection('projects').order('rank', 'ASC').all(),
);
const { data: certificatesData } = await useAsyncData('certificates', () => queryCollection('certificates').all());

const projects = computed(() => projectsData.value ?? []);
const certificates = computed(() => certificatesData.value ?? []);

// ── Filtering ────────────────────────────────────────────────────
const searchQuery = ref('');
const selectedStack = ref<string[]>([]);

const uniqueStacks = computed(() => {
  const stacks = new Set<string>();
  for (const p of projects.value) {
    for (const s of p.stack ?? []) stacks.add(s);
  }
  return [...stacks].sort();
});

const filteredProjects = computed(() => {
  const query = searchQuery.value.toLowerCase().trim();
  const selected = selectedStack.value;
  return projects.value.filter((p) => {
    const matchesSearch =
      !query || (p.title ?? '').toLowerCase().includes(query) || (p.description ?? '').toLowerCase().includes(query);
    const matchesStack = selected.length === 0 || (p.stack ?? []).some((s) => selected.includes(s));
    return matchesSearch && matchesStack;
  });
});

const hasActiveFilters = computed(() => searchQuery.value.trim() !== '' || selectedStack.value.length > 0);

function clearFilters() {
  searchQuery.value = '';
  selectedStack.value = [];
}

// ── Pagination ───────────────────────────────────────────────────
const PAGE_SIZE = 6;
const page = ref(1);

watch(filteredProjects, () => {
  page.value = 1;
});

const paginatedProjects = computed(() => {
  const start = (page.value - 1) * PAGE_SIZE;
  return filteredProjects.value.slice(start, start + PAGE_SIZE);
});

// ── Hero / CTA links ─────────────────────────────────────────────
const heroLinks = computed<ButtonProps[]>(() => {
  if (!profile.value) return [];
  return [
    {
      color: 'primary',
      icon: 'i-lucide-mail',
      label: 'Contact Me',
      to: `mailto:${profile.value.email}`,
    },
    {
      color: 'neutral',
      icon: 'i-simple-icons-github',
      label: 'GitHub',
      target: '_blank',
      to: profile.value.github,
      variant: 'subtle',
    },
    {
      color: 'neutral',
      icon: 'i-simple-icons-linkedin',
      label: 'LinkedIn',
      target: '_blank',
      to: profile.value.linkedin,
      variant: 'subtle',
    },
  ];
});

const ctaLinks = computed<ButtonProps[]>(() => {
  if (!profile.value) return [];
  return [
    {
      color: 'primary',
      icon: 'i-lucide-mail',
      label: 'Send Email',
      to: `mailto:${profile.value.email}`,
    },
  ];
});
</script>

<template>
  <div>
    <UPageHero
      v-if="profile"
      :title="profile.name"
      :description="profile.bio"
      align="left"
      orientation="horizontal"
      :links="heroLinks"
    >
      <img
        src="/images/favicon.webp"
        alt="Prince Mbeah Essilfie"
        class="rounded-lg shadow-lg w-full max-w-sm mx-auto"
      />
    </UPageHero>

    <UPageSection
      id="projects"
      title="Projects"
      description="A selection of my work across various platforms and languages."
    >
      <div
        class="flex items-center justify-center w-full flex-col sm:flex-row gap-3"
      >
        <UInput
          v-model="searchQuery"
          icon="i-lucide-search"
          placeholder="Search projects..."
          class="w-full sm:w-64"
        />
        <USelectMenu
          v-model="selectedStack"
          :items="uniqueStacks"
          placeholder="Filter by stack"
          multiple
          class="w-full sm:w-64"
        />
        <UButton
          v-if="hasActiveFilters"
          icon="i-lucide-x"
          color="neutral"
          variant="ghost"
          @click="clearFilters"
        >
          Clear
        </UButton>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <ProjectCard
          v-for="project in paginatedProjects"
          :key="project.title"
          :project="project"
        />
      </div>

      <div
        v-if="filteredProjects.length === 0"
        class="text-center py-8 text-muted"
      >
        No projects found matching your criteria.
      </div>

      <div
        v-if="filteredProjects.length > PAGE_SIZE"
        class="flex justify-center mt-6"
      >
        <UPagination
          v-model:page="page"
          :total="filteredProjects.length"
          :page-size="PAGE_SIZE"
        />
      </div>
    </UPageSection>

    <UPageSection
      id="certifications"
      title="Certifications"
      description="Continuous learning and professional development."
    >
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
        <CertificateCard
          v-for="cert in certificates"
          :key="cert.name"
          :certificate="cert"
        />
      </div>
    </UPageSection>

    <UPageCTA
      v-if="profile"
      title="Interested in working together?"
      description="Feel free to reach out via email or social media."
      :links="ctaLinks"
    />
  </div>
</template>

<script setup lang="ts">
import type { ButtonProps } from '@nuxt/ui';

const { data: profile } = await useProfile();
const { data: projectsData } = await useAsyncData('projects', () =>
  queryCollection('projects').order('rank', 'ASC').all(),
);
const { data: certificatesData } = await useAsyncData('certificates', () => queryCollection('certificates').all());

const projects = computed(() => projectsData.value || []);
const certificates = computed(() => certificatesData.value || []);

const searchQuery = ref('');
const selectedStack = ref<string[]>([]);

const uniqueStacks = computed(() => {
  const stacks = new Set<string>();
  projects.value.forEach((project) => {
    project.stack?.forEach((s: string) => {
      stacks.add(s);
    });
  });
  return Array.from(stacks).sort();
});

const filteredProjects = computed(() => {
  if (!projects.value) return [];

  return projects.value.filter((project) => {
    const query = searchQuery.value.toLowerCase();
    const title = project.title?.toLowerCase() || '';
    const description = project.description?.toLowerCase() || '';

    const matchesSearch = !query || title.includes(query) || description.includes(query);

    const selected = selectedStack.value || [];
    const stack = project.stack || [];

    const matchesStack = selected.length === 0 || stack.some((s: string) => selected.includes(s));

    return matchesSearch && matchesStack;
  });
});

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
        src="/images/profile_image.webp"
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
        class="flex items-center justify-center w-full flex-col sm:flex-row gap-4"
      >
        <UInput
          v-model="searchQuery"
          icon="i-heroicons-magnifying-glass-20-solid"
          placeholder="Search projects..."
          class="w-full sm:w-64"
        />
        <USelectMenu
          v-model="selectedStack"
          :items="uniqueStacks"
          placeholder="Filter by stack"
          multiple
          searchable
          class="w-full sm:w-64"
        />
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <ProjectCard
          v-for="project in filteredProjects"
          :key="project.title"
          :project="project"
        />
      </div>

      <div
        v-if="filteredProjects.length === 0"
        class="text-center py-8 text-gray-500 dark:text-gray-400"
      >
        No projects found matching your criteria.
      </div>
    </UPageSection>

    <UPageSection
      id="certifications"
      title="Certifications"
      description="Continuous learning and professional development."
    >
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-6 mt-4">
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

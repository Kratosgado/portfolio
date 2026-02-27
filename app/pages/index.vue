<script setup lang="ts">
const { data: profile } = await useAsyncData('profile', () => queryCollection('profile').first());
const { data: projectsData } = await useAsyncData('projects', () => queryCollection('projects').all());
const { data: certificatesData } = await useAsyncData('certificates', () => queryCollection('certificates').all());

const projects = computed(() => projectsData.value || []);
const certificates = computed(() => certificatesData.value || []);

const heroLinks = computed(() => {
  if (!profile.value) return [];
  return [
    {
      label: 'Contact Me',
      to: `mailto:${profile.value.email}`,
      icon: 'i-lucide-mail',
      color: 'primary',
    },
    {
      label: 'GitHub',
      to: profile.value.github,
      target: '_blank',
      color: 'neutral',
      variant: 'subtle',
      icon: 'i-simple-icons-github',
    },
    {
      label: 'LinkedIn',
      to: profile.value.linkedin,
      target: '_blank',
      color: 'neutral',
      variant: 'subtle',
      icon: 'i-simple-icons-linkedin',
    },
  ];
});

const ctaLinks = computed(() => {
  if (!profile.value) return [];
  return [
    {
      label: 'Send Email',
      to: `mailto:${profile.value.email}`,
      icon: 'i-lucide-mail',
      color: 'primary',
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
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-4">
        <ProjectCard v-for="project in projects" :key="project.name" :project />
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

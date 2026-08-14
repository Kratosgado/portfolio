<script setup lang="ts">
const { data: profile } = await useProfile();
const { data: projectsData } = await useAsyncData('projects', () =>
  queryCollection('projects').order('rank', 'ASC').all(),
);
const { data: certificatesData } = await useAsyncData('certificates', () =>
  queryCollection('certificates').all(),
);

const projects = computed(() => projectsData.value ?? []);
const certificates = computed(() => certificatesData.value ?? []);
</script>

<template>
  <div>
    <!-- Fixed 3D background — stays viewport-anchored while page scrolls -->
    <ClientOnly>
      <HeroScene />
    </ClientOnly>

    <!-- Hero Section — transparent so the 3D shows through -->
    <div class="relative z-10">
      <HeroSection v-if="profile" :profile="profile" />
    </div>

    <!-- Remaining sections — transparent so the fixed 3D background shows through -->
    <div class="relative z-10">
      <AboutSection v-if="profile" :profile="profile" />
      <ExperienceSection />
      <ProjectsSection :projects="projects" />
      <CertificationsSection :certificates="certificates" />
      <ContactSection v-if="profile" :profile="profile" />
    </div>
  </div>
</template>

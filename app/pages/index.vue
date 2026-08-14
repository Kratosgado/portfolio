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
    <!-- Hero Section -->
    <HeroSection v-if="profile" :profile="profile" />

    <!-- About & Skills Section -->
    <AboutSection v-if="profile" :profile="profile" />

    <!-- Experience Timeline -->
    <ExperienceSection />

    <!-- Projects Showcase -->
    <ProjectsSection :projects="projects" />

    <!-- Certifications & Blog -->
    <CertificationsSection :certificates="certificates" />

    <!-- Contact / CTA -->
    <ContactSection v-if="profile" :profile="profile" />
  </div>
</template>

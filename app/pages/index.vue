<script setup lang="ts"></script>

<template>
  <div>
    <UPageHero
      :title="profile.name"
      :description="profile.bio"
      align="left"
      orientation="horizontal"
      :links="[
        {
          label: 'Contact Me',
          to: 'mailto:mbeahessilfieprince@gmail.com',
          icon: 'i-lucide-mail',
          color: 'primary',
        },
        {
          label: 'GitHub',
          to: 'https://github.com/Kratosgado',
          target: '_blank',
          color: 'neutral',
          variant: 'subtle',
          icon: 'i-simple-icons-github',
        },
        {
          label: 'LinkedIn',
          to: 'https://www.linkedin.com/in/kratosgado',
          target: '_blank',
          color: 'neutral',
          variant: 'subtle',
          icon: 'i-simple-icons-linkedin',
        },
      ]"
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
      title="Interested in working together?"
      description="Feel free to reach out via email or social media."
      :links="[
        {
          label: 'Send Email',
          to: 'mailto:mbeahessilfieprince@gmail.com',
          icon: 'i-lucide-mail',
          color: 'primary',
        },
      ]"
    />
  </div>
</template>

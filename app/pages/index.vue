<template>
  <div>
    <!-- Fixed 3D background — stays viewport-anchored while page scrolls -->
    <ClientOnly>
      <HeroScene />
    </ClientOnly>

    <!-- Hero Section — transparent so the 3D shows through -->
    <div class="relative z-10">
      <HeroSection />
    </div>

    <!-- Remaining sections — transparent so the fixed 3D background shows through -->
    <div class="relative z-10">
      <AboutSection />
      <ExperienceSection />
      <ProjectsSection />
      <CertificationsSection />
      <ContactSection />
    </div>
  </div>
</template>

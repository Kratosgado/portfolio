<template>
  <div>
    <!-- Silk shader background — fixed behind page content -->
    <ClientOnly>
      <SilkBackground
        class="fixed inset-0 z-0 opacity-60 pointer-events-none"
        :hue="30"
        :saturation="0.7"
        :brightness="0.9"
        :speed="0.6"
      />
    </ClientOnly>

    <div class="relative z-10">
      <HeroSection />
      <AboutSection />
      <ExperienceSection />
      <ProjectsSection />
      <CertificationsSection />
      <ContactSection />
    </div>
  </div>
</template>

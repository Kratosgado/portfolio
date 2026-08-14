<script setup lang="ts">
defineProps<{
  profile: {
    name: string;
    bio: string;
    email: string;
    github: string;
    linkedin: string;
  };
}>();
</script>

<template>
  <section class="relative h-screen flex items-center justify-center overflow-hidden">
    <!-- Particle Background -->
    <ClientOnly>
      <vue-particles
        id="hero-particles"
        :options="{
          fullScreen: { enable: false },
          background: { color: { value: 'transparent' } },
          fpsLimit: 60,
          particles: {
            color: { value: ['#d97706', '#f59e0b', '#38bdf8'] },
            links: {
              color: '#d97706',
              distance: 150,
              enable: true,
              opacity: 0.15,
              width: 1,
            },
            move: {
              enable: true,
              speed: 0.8,
              direction: 'none',
              outModes: { default: 'bounce' },
            },
            number: {
              value: 60,
              density: { enable: true },
            },
            opacity: { value: { min: 0.1, max: 0.4 } },
            size: { value: { min: 1, max: 3 } },
          },
          detectRetina: true,
        }"
        class="absolute inset-0 z-0"
      />
    </ClientOnly>

    <!-- Gradient Overlay -->
    <div class="absolute inset-0 bg-gradient-to-b from-transparent via-transparent to-[var(--color-bg-base)] z-10 pointer-events-none" />

    <!-- Hero Content -->
    <div class="relative z-20 text-center max-w-4xl mx-auto px-6">
      <div class="space-y-6">
        <!-- Greeting -->
        <p
          class="text-[var(--color-text-secondary)] text-lg font-mono opacity-0 animate-fade-in-up stagger-1"
        >
          Hello, I'm
        </p>

        <!-- Name -->
        <h1
          class="text-5xl md:text-7xl lg:text-8xl font-heading font-bold gradient-text-animated opacity-0 animate-fade-in-up stagger-2"
        >
          {{ profile.name }}
        </h1>

        <!-- Tagline -->
        <p
          class="text-xl md:text-2xl text-[var(--color-text-secondary)] max-w-2xl mx-auto opacity-0 animate-fade-in-up stagger-3"
        >
          {{ profile.bio }}
        </p>

        <!-- CTA Buttons -->
        <div class="flex flex-wrap items-center justify-center gap-4 pt-4 opacity-0 animate-fade-in-up stagger-4">
          <a
            :href="`mailto:${profile.email}`"
            class="btn-neon btn-neon-primary flex items-center gap-2"
          >
            <UIcon name="i-lucide-mail" class="size-5" />
            Get in Touch
          </a>
          <a
            :href="profile.github"
            target="_blank"
            rel="noopener noreferrer"
            class="btn-neon flex items-center gap-2"
          >
            <UIcon name="i-simple-icons-github" class="size-5" />
            GitHub
          </a>
          <a
            :href="profile.linkedin"
            target="_blank"
            rel="noopener noreferrer"
            class="btn-neon flex items-center gap-2"
          >
            <UIcon name="i-simple-icons-linkedin" class="size-5" />
            LinkedIn
          </a>
        </div>
      </div>

      <!-- Scroll Indicator -->
      <div class="absolute bottom-8 left-1/2 -translate-x-1/2 opacity-0 animate-fade-in-up stagger-6">
        <div class="flex flex-col items-center gap-2 text-[var(--color-text-muted)]">
          <span class="text-xs font-mono">scroll</span>
          <div class="w-px h-8 bg-gradient-to-b from-[var(--color-accent-start)] to-transparent animate-pulse" />
        </div>
      </div>
    </div>
  </section>
</template>

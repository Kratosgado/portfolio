<script setup lang="ts">
const { data: profile, pending } = useProfile();
</script>

<template>
  <section
    class="relative h-screen flex items-center justify-center overflow-hidden"
  >
    <!-- Gradient Overlay -->
    <div
      class="absolute inset-0 bg-linear-to-b from-transparent via-transparent to-bg-base z-10 pointer-events-none"
    />

    <!-- Loading skeleton -->
    <div
      v-if="pending"
      class="relative z-20 text-center max-w-4xl mx-auto px-6 animate-pulse space-y-6"
    >
      <div class="h-5 bg-white/10 rounded-full w-24 mx-auto" />
      <div class="h-20 bg-white/10 rounded-xl w-3/4 mx-auto" />
      <div class="h-6 bg-white/10 rounded-full w-1/2 mx-auto" />
      <div class="flex justify-center gap-4">
        <div class="h-10 bg-white/10 rounded-full w-36" />
        <div class="h-10 bg-white/10 rounded-full w-28" />
        <div class="h-10 bg-white/10 rounded-full w-32" />
      </div>
    </div>

    <!-- Hero Content -->
    <div
      v-else-if="profile"
      class="relative z-20 text-center max-w-4xl mx-auto px-6"
    >
      <div class="space-y-6">
        <!-- Greeting -->
        <p
          class="text-text-secondary text-lg font-mono opacity-0 animate-fade-in-up stagger-1"
        >
          Hola Mundo
        </p>

        <!-- Name -->
        <h1
          class="text-5xl md:text-7xl lg:text-8xl font-heading font-bold gradient-text-animated opacity-0 animate-fade-in-up stagger-2"
        >
          {{ profile.name }}
        </h1>

        <!-- Tagline -->
        <p
          class="text-xl md:text-2xl text-text-secondary max-w-2xl mx-auto opacity-0 animate-fade-in-up stagger-3"
        >
          {{ profile.bio }}
        </p>

        <!-- CTA Buttons -->
        <div
          class="flex flex-wrap items-center justify-center gap-4 pt-4 opacity-0 animate-fade-in-up stagger-4"
        >
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
      <div
        class="absolute bottom-8 left-1/2 -translate-x-1/2 opacity-0 animate-fade-in-up stagger-6"
      >
        <div class="flex flex-col items-center gap-2 text-text-muted">
          <div
            class="w-px h-8 bg-linear-to-b from-accent-start to-transparent animate-pulse"
          />
        </div>
      </div>
    </div>
  </section>
</template>

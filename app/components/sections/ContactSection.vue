<script setup lang="ts">
const { data: profile, pending } = await useProfile();

const socials = [
  {
    label: 'GitHub',
    icon: 'i-simple-icons-github',
    href: 'https://github.com/Kratosgado',
    color: '#f0f0f5',
  },
  {
    label: 'LinkedIn',
    icon: 'i-simple-icons-linkedin',
    href: 'https://www.linkedin.com/in/kratosgado',
    color: '#0077b5',
  },
  {
    label: 'Email',
    icon: 'i-lucide-mail',
    href: 'mailto:mbeahessilfieprince@gmail.com',
    color: '#d97706',
  },
  {
    label: 'Blog',
    icon: 'i-lucide-pen-tool',
    href: 'https://blog.bitshiftdevs.com',
    color: '#f59e0b',
  },
];
</script>

<template>
  <section id="contact" class="section-viewport relative flex items-center justify-center">
    <!-- Particle Background -->
    <ClientOnly>
      <vue-particles
        id="contact-particles"
        :options="{
          fullScreen: { enable: false },
          background: { color: { value: 'transparent' } },
          fpsLimit: 30,
          particles: {
            color: { value: ['#d97706', '#f59e0b'] },
            move: {
              enable: true,
              speed: 0.3,
              direction: 'none',
              outModes: { default: 'out' },
            },
            number: { value: 30 },
            opacity: { value: { min: 0.05, max: 0.2 } },
            size: { value: { min: 0.5, max: 2 } },
            shape: { type: 'circle' },
          },
          detectRetina: true,
        }"
        class="absolute inset-0 z-0"
      />
    </ClientOnly>

    <!-- Content -->
    <div class="relative z-10 text-center max-w-3xl mx-auto px-6">
      <!-- Heading -->
      <h2 class="text-4xl md:text-6xl lg:text-7xl font-heading font-bold gradient-text-animated leading-tight">
        Let's build something together
      </h2>

      <p class="text-lg text-[var(--color-text-secondary)] mt-6 max-w-xl mx-auto">
        I'm always open to interesting projects, collaborations, or just chatting about engineering.
      </p>

      <!-- Social Links -->
      <div class="flex flex-wrap items-center justify-center gap-5 mt-10">
        <a
          v-for="social in socials"
          :key="social.label"
          :href="social.href"
          :target="social.href.startsWith('mailto') ? undefined : '_blank'"
          :rel="social.href.startsWith('mailto') ? undefined : 'noopener noreferrer'"
          class="group flex flex-col items-center gap-2 p-4 rounded-xl bg-white/5 border border-white/10 hover:border-[var(--color-accent-start)] hover:bg-white/8 transition-all duration-300 hover:shadow-[0_0_25px_rgba(217,119,6,0.2)] hover:-translate-y-1"
          :aria-label="social.label"
        >
          <UIcon
            :name="social.icon"
            class="size-7 text-[var(--color-text-secondary)] group-hover:text-[var(--color-accent-start)] transition-colors"
          />
          <span class="text-xs text-[var(--color-text-muted)] group-hover:text-[var(--color-text-primary)] transition-colors">
            {{ social.label }}
          </span>
        </a>
      </div>

      <!-- Direct CTA -->
      <div class="mt-10">
        <div v-if="pending" class="animate-pulse h-12 w-52 bg-white/10 rounded-full mx-auto" />
        <a
          v-else-if="profile"
          :href="`mailto:${profile.email}`"
          class="btn-neon btn-neon-primary inline-flex items-center gap-2 text-lg"
        >
          <UIcon name="i-lucide-send" class="size-5" />
          Send me an email
        </a>
      </div>
    </div>
  </section>
</template>

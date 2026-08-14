<script setup lang="ts">
import { useScrollAnimation } from '~/composables/useScrollAnimation';

defineProps<{
  profile: {
    name: string;
    bio: string;
  };
}>();

const { fadeInUp, animateCounter } = useScrollAnimation();

const sectionRef = ref<HTMLElement>();
const counterRefs = ref<HTMLElement[]>([]);

const skills = [
  {
    category: 'Core Expertise',
    items: ['Spring Boot', 'NestJS', 'TypeScript', 'Rust', 'Java', 'PostgreSQL'],
    icon: 'i-lucide-code-2',
    size: 'col-span-2 row-span-2',
  },
  {
    category: 'Frontend',
    items: ['Vue', 'Nuxt', 'React', 'Angular', 'Flutter'],
    icon: 'i-lucide-layout',
    size: 'col-span-1 row-span-1',
  },
  {
    category: 'Tools & Infra',
    items: ['Docker', 'Git', 'GitHub Actions', 'Cloudflare', 'GCP'],
    icon: 'i-lucide-wrench',
    size: 'col-span-1 row-span-2',
  },
  {
    category: 'Realtime',
    items: ['WebSocket', 'Socket.io', 'SSE'],
    icon: 'i-lucide-radio',
    size: 'col-span-1 row-span-1',
  },
];

const stats = [
  { value: 2.5, suffix: '+', label: 'Years Experience', decimal: true },
  { value: 21, suffix: '', label: 'Projects Built', decimal: false },
  { value: 5, suffix: '', label: 'VS Code Extensions', decimal: false },
  { value: 1800, suffix: '+', label: 'Extension Installs', decimal: false },
];

onMounted(() => {
  if (sectionRef.value) {
    fadeInUp(sectionRef.value.querySelector('.about-bio') as HTMLElement);
  }

  counterRefs.value.forEach((el, i) => {
    if (el) {
      const stat = stats[i];
      const target = stat.value;
      const suffix = stat.suffix;
      const obj = { value: 0 };

      // Use gsap directly for counter with decimal support
      import('gsap').then(({ gsap }) => {
        import('gsap/ScrollTrigger').then(({ ScrollTrigger }) => {
          gsap.registerPlugin(ScrollTrigger);
          gsap.to(obj, {
            value: target,
            duration: 2,
            ease: 'power2.out',
            scrollTrigger: {
              trigger: el,
              start: 'top 85%',
              once: true,
            },
            onUpdate: () => {
              if (stat.decimal) {
                el.textContent = `${obj.value.toFixed(1)}${suffix}`;
              } else {
                el.textContent = `${Math.round(obj.value).toLocaleString()}${suffix}`;
              }
            },
          });
        });
      });
    }
  });
});
</script>

<template>
  <section
    id="about"
    ref="sectionRef"
    class="section-viewport max-w-7xl mx-auto"
  >
    <!-- Section Header -->
    <div class="mb-16" data-reveal>
      <h2 class="section-title gradient-text">About Me</h2>
      <p class="section-subtitle">Backend-focused engineer who builds tools developers love.</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-start">
      <!-- Left: Bio & Stats -->
      <div class="space-y-8">
        <div class="about-bio">
          <p class="text-lg text-[var(--color-text-secondary)] leading-relaxed">
            Backend-focused full-stack engineer with production experience across
            <span class="text-[var(--color-neon-blue)]">Spring Boot</span>,
            <span class="text-[var(--color-neon-violet)]">NestJS</span>, and
            <span class="text-[var(--color-neon-emerald)]">TypeScript</span>,
            delivering systems in health and enterprise domains — from authentication architecture
            to real-time communication and automated financial computation.
          </p>
          <p class="text-lg text-[var(--color-text-secondary)] leading-relaxed mt-4">
            Comfortable owning features end-to-end across frontend, backend, database, and cloud infrastructure.
            I also build developer tools — VS Code extensions and Neovim plugins that streamline workflows.
          </p>
        </div>

        <!-- Stats Grid -->
        <div class="grid grid-cols-2 gap-4">
          <div
            v-for="(stat, i) in stats"
            :key="stat.label"
            class="glass-card p-5 text-center"
          >
            <div
              :ref="(el) => { if (el) counterRefs[i] = el as HTMLElement }"
              class="text-3xl font-heading font-bold gradient-text"
            >
              0
            </div>
            <div class="text-sm text-[var(--color-text-muted)] mt-1">{{ stat.label }}</div>
          </div>
        </div>
      </div>

      <!-- Right: Bento Grid -->
      <div class="grid grid-cols-2 gap-4 auto-rows-[120px]">
        <div
          v-for="skill in skills"
          :key="skill.category"
          :class="[skill.size, 'glass-card p-5 flex flex-col justify-between group cursor-default hover:border-[var(--color-accent-start)]/30']"
        >
          <div class="flex items-center gap-2">
            <UIcon :name="skill.icon" class="size-5 text-[var(--color-accent-start)]" />
            <span class="text-sm font-semibold text-[var(--color-text-primary)]">{{ skill.category }}</span>
          </div>
          <div class="flex flex-wrap gap-1.5 mt-2">
            <span
              v-for="item in skill.items"
              :key="item"
              class="text-xs px-2 py-0.5 rounded-full bg-white/5 text-[var(--color-text-secondary)] group-hover:text-[var(--color-text-primary)] transition-colors"
            >
              {{ item }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

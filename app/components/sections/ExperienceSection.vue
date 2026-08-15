<script setup lang="ts">
const experience = [
  {
    bullets: [
      'Architected JWT RSA-based auth system with SSO integration, custom annotations, and role-based access control across six user roles.',
      'Designed a performance scoring engine managing PI periods, scoring frameworks, and automated target/bonus computation.',
      'Resolved N+1 query performance issues in GraphQL via batch fetching; enforced data-integrity via PostgreSQL triggers.',
      'Built rate limiting (100 req/min/user) and maintained 70%+ test coverage (JaCoCo, Hurl E2E).',
    ],
    company: 'Amalitech',
    location: 'Takoradi, Ghana',
    period: 'Nov 2025 – Present',
    role: 'Backend Engineer – NSP',
  },
  {
    bullets: [
      '2.5+ years owning backend systems for a health-tech platform: cloud storage, verification flows, PDF generation, real-time notifications (SSE, WebSocket), and EMR migration from TSOA to NestJS/Prisma.',
    ],
    company: 'Zomujo Foundation',
    location: 'Remote, Ghana',
    period: 'Oct 2023 – Feb 2026',
    role: 'Backend Engineer – Freelance',
    url: 'https://zomujo.com',
  },
];

const timelineRef = ref<HTMLElement>();
const lineRef = ref<HTMLElement>();

onMounted(async () => {
  const { gsap } = await import('gsap');
  const { ScrollTrigger } = await import('gsap/ScrollTrigger');
  gsap.registerPlugin(ScrollTrigger);

  // Draw the timeline line
  if (lineRef.value && timelineRef.value) {
    gsap.fromTo(
      lineRef.value,
      { scaleY: 0 },
      {
        ease: 'none',
        scaleY: 1,
        scrollTrigger: {
          end: 'bottom 50%',
          scrub: 1,
          start: 'top 60%',
          trigger: timelineRef.value,
        },
      },
    );
  }

  // Animate entries
  if (timelineRef.value) {
    const entries = timelineRef.value.querySelectorAll('.timeline-entry');
    entries.forEach((entry, i) => {
      gsap.from(entry, {
        duration: 0.8,
        ease: 'power3.out',
        opacity: 0,
        scrollTrigger: {
          once: true,
          start: 'top 80%',
          trigger: entry,
        },
        x: i % 2 === 0 ? -50 : 50,
      });
    });
  }
});
</script>

<template>
  <section
    id="experience"
    ref="timelineRef"
    class="section-viewport max-w-5xl mx-auto"
  >
    <!-- Section Header -->
    <div class="mb-16 text-center" data-reveal>
      <h2 class="section-title gradient-text">Experience</h2>
      <p class="section-subtitle mx-auto">Where I've been building things.</p>
    </div>

    <!-- Timeline -->
    <div class="relative">
      <!-- Timeline Line -->
      <div
        ref="lineRef"
        class="absolute left-1/2 -translate-x-1/2 top-0 bottom-0 w-px bg-linear-to-b from-accent-start via-accent-end to-transparent origin-top md:block hidden"
      />
      <!-- Mobile line -->
      <div
        class="absolute left-6 top-0 bottom-0 w-px bg-linear-to-b from-accent-start via-[var(--color-accent-end)] to-transparent md:hidden"
      />

      <!-- Entries -->
      <div class="space-y-16">
        <div
          v-for="(exp, i) in experience"
          :key="exp.company"
          class="timeline-entry relative"
        >
          <!-- Desktop: Alternating layout -->
          <div class="hidden md:grid md:grid-cols-2 md:gap-8 items-start">
            <!-- Left content (even entries) / Right content (odd entries) -->
            <div
              :class="i % 2 === 0 ? 'text-right pr-12' : 'col-start-2 pl-12'"
            >
              <div class="glass-card p-6 inline-block text-left">
                <div class="flex items-center gap-2 mb-2">
                  <div
                    class="w-3 h-3 rounded-full bg-gradient-to-r from-[var(--color-accent-start)] to-[var(--color-accent-end)]"
                  />
                  <span
                    class="text-xs font-mono text-[var(--color-text-muted)]"
                    >{{ exp.period }}</span
                  >
                </div>
                <h3
                  class="text-xl font-heading font-bold text-[var(--color-text-primary)]"
                >
                  {{ exp.role }}
                </h3>
                <p class="text-[var(--color-accent-start)] font-medium">
                  <a
                    v-if="exp.url"
                    :href="exp.url"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="hover:underline"
                  >
                    {{ exp.company }}
                  </a>
                  <span v-else>{{ exp.company }}</span>
                  <span class="text-[var(--color-text-muted)]">
                    • {{ exp.location }}</span
                  >
                </p>
                <ul class="mt-3 space-y-2">
                  <li
                    v-for="bullet in exp.bullets"
                    :key="bullet"
                    class="text-sm text-[var(--color-text-secondary)] pl-4 relative before:content-['▸'] before:absolute before:left-0 before:text-[var(--color-accent-start)]"
                  >
                    {{ bullet }}
                  </li>
                </ul>
              </div>
            </div>

            <!-- Node on the line -->
            <div
              class="absolute left-1/2 -translate-x-1/2 top-6 w-4 h-4 rounded-full border-2 border-[var(--color-accent-start)] bg-[var(--color-bg-base)]"
            />
          </div>

          <!-- Mobile: Stacked layout -->
          <div class="md:hidden pl-14 relative">
            <!-- Node -->
            <div
              class="absolute left-4 top-6 w-4 h-4 rounded-full border-2 border-[var(--color-accent-start)] bg-[var(--color-bg-base)]"
            />

            <div class="glass-card p-5">
              <div class="flex items-center gap-2 mb-2">
                <span
                  class="text-xs font-mono text-[var(--color-text-muted)]"
                  >{{ exp.period }}</span
                >
              </div>
              <h3
                class="text-lg font-heading font-bold text-[var(--color-text-primary)]"
              >
                {{ exp.role }}
              </h3>
              <p class="text-[var(--color-accent-start)] text-sm font-medium">
                {{ exp.company }} • {{ exp.location }}
              </p>
              <ul class="mt-3 space-y-2">
                <li
                  v-for="bullet in exp.bullets"
                  :key="bullet"
                  class="text-sm text-[var(--color-text-secondary)] pl-4 relative before:content-['▸'] before:absolute before:left-0 before:text-accent-start"
                >
                  {{ bullet }}
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

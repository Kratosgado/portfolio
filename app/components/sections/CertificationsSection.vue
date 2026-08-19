<script setup lang="ts">
const { data: certificatesData, pending } = useLazyAsyncData('certificates', () =>
  queryCollection('certificates').all(),
);

const certificates = computed(() => certificatesData.value ?? []);

onMounted(() => {
  const animate = async () => {
    await nextTick();
    const { gsap } = await import('gsap');
    gsap.from('.cert-card', {
      duration: 0.6,
      ease: 'power3.out',
      opacity: 0,
      stagger: 0.08,
      y: 30,
    });
  };

  if (!pending.value) {
    animate();
  } else {
    const stop = watch(pending, (isPending) => {
      if (!isPending) {
        stop();
        animate();
      }
    });
  }
});
</script>

<template>
  <section id="certifications" class="section-viewport max-w-6xl mx-auto">
    <!-- Section Header -->
    <div class="mb-12 text-center">
      <h2 class="section-title gradient-text">Certifications</h2>
      <p class="section-subtitle mx-auto">Continuous learning and professional development.</p>
    </div>

    <!-- Loading skeleton -->
    <div v-if="pending" class="animate-pulse grid grid-cols-1 md:grid-cols-2 gap-5 mb-16">
      <div v-for="i in 4" :key="i" class="glass-card p-6 space-y-3">
        <div class="flex items-start justify-between gap-4">
          <div class="flex-1 space-y-2">
            <div class="h-5 bg-white/5 rounded w-3/4" />
            <div class="h-4 bg-white/5 rounded w-1/2" />
          </div>
          <div class="size-6 bg-white/5 rounded" />
        </div>
        <div class="h-4 bg-white/5 rounded w-full" />
        <div class="h-4 bg-white/5 rounded w-5/6" />
      </div>
    </div>

    <template v-else>
      <!-- Cert Cards -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-5 mb-16">
        <FloatingCard
          v-for="cert in certificates"
          :key="cert.name"
          class="cert-card"
          :rotate-depth="6"
          :translate-depth="8"
        >
        <div class="glass-card p-6 h-full">
          <div class="flex items-start justify-between gap-4">
            <div>
              <h3 class="font-heading font-bold text-[var(--color-text-primary)]">{{ cert.name }}</h3>
              <p class="text-sm text-[var(--color-text-muted)] mt-1">
                {{ cert.organization }} • {{ cert.date }}
              </p>
            </div>
            <UIcon name="i-lucide-award" class="size-6 text-[var(--color-accent-start)] shrink-0" />
          </div>

          <p v-if="cert.skills" class="text-sm text-[var(--color-text-secondary)] mt-3">
            {{ cert.skills }}
          </p>

          <a
            v-if="cert.credential"
            :href="cert.credential"
            target="_blank"
            rel="noopener noreferrer"
            class="inline-flex items-center gap-1 mt-4 text-sm text-[var(--color-accent-start)] hover:text-[var(--color-neon-blue)] transition-colors"
          >
            View Credential
            <UIcon name="i-lucide-external-link" class="size-3" />
          </a>
        </div>
        </FloatingCard>
      </div>
    </template>

    <!-- Blog CTA -->
    <div class="blog-cta relative overflow-hidden rounded-2xl p-8 md:p-12">
      <!-- Animated gradient border -->
      <div class="absolute inset-0 rounded-2xl bg-gradient-to-r from-[var(--color-accent-start)] via-[var(--color-accent-end)] to-[var(--color-neon-blue)] p-px">
        <div class="h-full w-full rounded-2xl bg-[var(--color-bg-elevated)]" />
      </div>

      <!-- Content -->
      <div class="relative z-10 flex flex-col md:flex-row items-center gap-8">
        <div class="shrink-0">
          <div class="w-16 h-16 rounded-full bg-gradient-to-br from-[var(--color-accent-start)]/20 to-[var(--color-accent-end)]/20 flex items-center justify-center">
            <UIcon name="i-lucide-pen-tool" class="size-8 text-[var(--color-accent-start)]" />
          </div>
        </div>

        <div class="flex-1 text-center md:text-left">
          <h3 class="text-2xl font-heading font-bold text-[var(--color-text-primary)]">
            I Write About Engineering
          </h3>
          <p class="text-[var(--color-text-secondary)] mt-2">
            Backend systems, Rust, developer tools, and lessons from building production software.
          </p>
        </div>

        <a
          href="https://blog.bitshiftdevs.com"
          target="_blank"
          rel="noopener noreferrer"
          class="btn-neon btn-neon-primary shrink-0 flex items-center gap-2"
        >
          Read on BitShift Devs
          <UIcon name="i-lucide-arrow-right" class="size-4" />
        </a>
      </div>
    </div>
  </section>
</template>

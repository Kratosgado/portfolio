<script setup lang="ts">
const { data: resumes } = await useAsyncData('resumes', () =>
  queryCollection('resumes').all()
);

useSeoMeta({
  title: 'Resumes – Prince Mbeah Essilfie',
  description: 'Resume variants tailored for different job applications.',
});
</script>

<template>
  <div class="min-h-screen pt-24 pb-16">
    <div class="max-w-5xl mx-auto px-6">
      <!-- Back -->
      <NuxtLink
        to="/"
        class="inline-flex items-center gap-2 text-[var(--color-text-secondary)] hover:text-[var(--color-accent-start)] transition-colors mb-8 group"
      >
        <UIcon name="i-lucide-arrow-left" class="size-4 group-hover:-translate-x-1 transition-transform" />
        <span class="text-sm">Home</span>
      </NuxtLink>

      <h1 class="text-4xl font-heading font-bold gradient-text mb-3">Resumes</h1>
      <p class="text-[var(--color-text-secondary)] mb-10">
        Click a resume to view and export as PDF.
      </p>

      <div class="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
        <NuxtLink
          v-for="resume in resumes"
          :key="resume.slug"
          :to="`/resume/${resume.slug}`"
          class="glass-card p-6 group hover:border-[var(--color-accent-start)]/30 transition-all"
        >
          <div class="flex items-center gap-3 mb-3">
            <div class="w-10 h-10 rounded-lg bg-gradient-to-br from-[var(--color-accent-start)]/20 to-[var(--color-accent-end)]/20 flex items-center justify-center">
              <UIcon name="i-lucide-file-text" class="size-5 text-[var(--color-accent-start)]" />
            </div>
            <h3 class="font-heading font-bold text-[var(--color-text-primary)] group-hover:text-[var(--color-accent-start)] transition-colors">
              {{ resume.title }}
            </h3>
          </div>
          <p class="text-sm text-[var(--color-text-muted)]">{{ resume.targetRole }}</p>
          <div class="flex items-center gap-1 mt-4 text-sm text-[var(--color-accent-start)] opacity-0 group-hover:opacity-100 transition-opacity">
            View Resume <UIcon name="i-lucide-arrow-right" class="size-3" />
          </div>
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

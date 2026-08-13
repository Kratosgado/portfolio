<script setup lang="ts">
const { data: resumes } = await useAsyncData('resumes', () =>
  queryCollection('resumes').all()
)

useSeoMeta({
  title: 'Resumes – Prince Mbeah Essilfie',
  description: 'Resume variants tailored for different job applications.',
})
</script>

<template>
  <UPageSection>
    <template #title>Resumes</template>
    <template #description>
      Click a resume to view and export as PDF.
    </template>

    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 mt-6">
      <UPageCard
        v-for="resume in resumes"
        :key="resume.slug"
        :title="resume.title"
        :description="resume.targetRole"
        :to="`/resume/${resume.slug}`"
        :ui="{ root: 'hover:ring-primary transition-shadow' }"
      >
        <template #footer>
          <UButton :to="`/resume/${resume.slug}`" variant="soft" trailing-icon="i-lucide-arrow-right">
            View Resume
          </UButton>
        </template>
      </UPageCard>
    </div>
  </UPageSection>
</template>

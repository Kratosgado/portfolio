<script setup lang="ts">
const route = useRoute()
const slug = route.params.slug as string

const { data: resume } = await useAsyncData(`resume-${slug}`, () =>
  queryCollection('resumes').where('slug', '==', slug).first()
)

if (!resume.value) {
  throw createError({ statusCode: 404, statusMessage: 'Resume not found' })
}

useSeoMeta({
  title: `${resume.value.header.name} – ${resume.value.title}`,
  description: resume.value.profile.slice(0, 160),
})

useHead({
  link: [
    {
      rel: 'preconnect',
      href: 'https://fonts.googleapis.com',
    },
    {
      rel: 'preconnect',
      href: 'https://fonts.gstatic.com',
      crossorigin: '',
    },
    {
      rel: 'stylesheet',
      href: 'https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap',
    },
  ],
})

function print() {
  window.print()
}
</script>

<template>
  <div v-if="resume">
    <div class="no-print flex items-center justify-between max-w-[780px] mx-auto px-8 py-4 gap-4">
      <UButton to="/resume" variant="ghost" icon="i-lucide-arrow-left" color="neutral">
        All Resumes
      </UButton>
      <UButton icon="i-lucide-printer" @click="print">
        Print / Save PDF
      </UButton>
    </div>

    <ResumeDocument :resume="resume" />
  </div>
</template>

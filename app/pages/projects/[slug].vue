<script setup lang="ts">
const route = useRoute();
const slug = route.params.slug as string;

const { data: page } = await useAsyncData(`project-${slug}`, () =>
  queryCollection('projects').path(`/projects/${slug}`).first(),
);

if (!page.value) {
  throw createError({ statusCode: 404, statusMessage: 'Project not found' });
}

useHead({
  title: page.value.title,
  meta: [{ name: 'description', content: page.value.description }],
});
</script>

<template>
  <div v-if="page" class="max-w-4xl mx-auto px-4 py-8">
    <UButton
      label="Back to Projects"
      icon="i-lucide-arrow-left"
      color="neutral"
      variant="ghost"
      to="/#projects"
      class="mb-6"
    />

    <h1 class="text-4xl font-bold mb-4">{{ page.title }}</h1>
    <p class="text-lg text-muted mb-6">{{ page.description }}</p>

    <div class="flex flex-wrap gap-2 mb-6">
      <UBadge
        v-for="tech in page.stack"
        :key="tech"
        color="neutral"
        variant="subtle"
      >
        {{ tech }}
      </UBadge>
    </div>

    <div class="flex gap-3 mb-8">
      <UButton
        v-if="page.github"
        label="View Code"
        icon="i-simple-icons-github"
        color="neutral"
        variant="soft"
        :to="page.github"
        target="_blank"
      />
      <UButton
        v-if="page.liveUrl"
        label="Live Demo"
        icon="i-lucide-external-link"
        color="primary"
        variant="soft"
        :to="page.liveUrl"
        target="_blank"
      />
    </div>

    <NuxtImg
      v-if="page.coverImage"
      :src="page.coverImage"
      :alt="page.title"
      class="w-full rounded-lg shadow-md mb-8"
    />

    <ContentRenderer
      :value="page"
      class="prose prose-lg dark:prose-invert max-w-none"
    />

    <div v-if="page.images?.length" class="mt-10">
      <h2 class="text-2xl font-bold mb-4">Screenshots</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <NuxtImg
          v-for="(image, index) in page.images"
          :key="index"
          :src="image"
          :alt="`${page.title} screenshot ${index + 1}`"
          class="w-full rounded-lg shadow-md"
        />
      </div>
    </div>
  </div>
</template>

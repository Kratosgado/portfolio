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
  meta: [{ content: page.value.description, name: 'description' }],
  title: `${page.value.title} - Kratosgado`,
});
</script>

<template>
  <div v-if="page" class="min-h-screen pt-24 pb-16">
    <!-- Hero Area -->
    <div class="relative overflow-hidden">
      <div class="max-w-5xl mx-auto px-6">
        <!-- Back Button -->
        <NuxtLink
          to="/#projects"
          class="inline-flex items-center gap-2 text-[var(--color-text-secondary)] hover:text-[var(--color-accent-start)] transition-colors mb-8 group"
        >
          <UIcon name="i-lucide-arrow-left" class="size-4 group-hover:-translate-x-1 transition-transform" />
          <span class="text-sm">Back to Projects</span>
        </NuxtLink>

        <!-- Title & Meta -->
        <h1 class="text-4xl md:text-5xl font-heading font-bold gradient-text mb-4">
          {{ page.title }}
        </h1>
        <p class="text-lg text-[var(--color-text-secondary)] max-w-2xl mb-6">
          {{ page.description }}
        </p>

        <!-- Stack -->
        <div class="flex flex-wrap gap-2 mb-6">
          <span
            v-for="tech in page.stack"
            :key="tech"
            class="text-xs px-3 py-1 rounded-full bg-white/5 border border-white/10 text-[var(--color-text-secondary)]"
          >
            {{ tech }}
          </span>
        </div>

        <!-- Action Links -->
        <div class="flex flex-wrap gap-3 mb-10">
          <a
            v-if="page.github"
            :href="page.github"
            target="_blank"
            rel="noopener noreferrer"
            class="btn-neon flex items-center gap-2 text-sm"
          >
            <UIcon name="i-simple-icons-github" class="size-4" />
            View Code
          </a>
          <a
            v-if="page.liveUrl"
            :href="page.liveUrl"
            target="_blank"
            rel="noopener noreferrer"
            class="btn-neon btn-neon-primary flex items-center gap-2 text-sm"
          >
            <UIcon name="i-lucide-external-link" class="size-4" />
            Live Demo
          </a>
        </div>

        <!-- Cover Image -->
        <div v-if="page.coverImage" class="rounded-xl overflow-hidden border border-white/10 mb-12">
          <NuxtImg
            :src="page.coverImage"
            :alt="page.title"
            class="w-full"
          />
        </div>

        <!-- Content -->
        <div class="prose prose-lg prose-invert max-w-none
          prose-headings:font-heading prose-headings:text-[var(--color-text-primary)]
          prose-p:text-[var(--color-text-secondary)]
          prose-a:text-[var(--color-accent-start)] prose-a:no-underline hover:prose-a:underline
          prose-code:text-[var(--color-neon-blue)] prose-code:bg-white/5 prose-code:px-1.5 prose-code:py-0.5 prose-code:rounded
          prose-strong:text-[var(--color-text-primary)]
          prose-li:text-[var(--color-text-secondary)]
        ">
          <ContentRenderer :value="page" />
        </div>

        <!-- Screenshots -->
        <div v-if="page.images?.length" class="mt-16">
          <h2 class="text-2xl font-heading font-bold text-[var(--color-text-primary)] mb-6">Screenshots</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div
              v-for="(image, index) in page.images"
              :key="index"
              class="rounded-xl overflow-hidden border border-white/10 hover:border-[var(--color-accent-start)]/30 transition-colors"
            >
              <NuxtImg
                :src="image"
                :alt="`${page.title} screenshot ${index + 1}`"
                class="w-full"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

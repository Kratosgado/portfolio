<script setup lang="ts">
import type { ProjectsCollectionItem } from '@nuxt/content';

defineProps<{ project: ProjectsCollectionItem }>();
</script>

<template>
  <UPageCard
    class="hover:ring-2 hover:ring-primary-500 transition-all h-full flex flex-col"
    spotlight
    :ui="{ header: 'w-full flex flex-col', footer: 'pt-2' }"
  >
    <template #header>
      <div class="flex justify-between items-center">
        <h3 class="font-bold text-lg text-primary">{{ project.title }}</h3>
        <UButton
          v-if="project.github"
          icon="i-simple-icons-github"
          color="neutral"
          variant="ghost"
          :to="project.github"
          target="_blank"
        />
      </div>
      <div v-if="project.stack" class="flex flex-wrap gap-2 mt-auto">
        <UBadge
          v-for="tech in project.stack"
          :key="tech"
          color="neutral"
          variant="subtle"
          size="xs"
        >
          {{ tech }}
        </UBadge>
      </div>
    </template>

    <template #body>
      <NuxtLink
        :to="project.slug ? `/projects/${project.slug}` : undefined"
        class="block h-full"
        :class="{ 'pointer-events-none': !project.slug }"
      >
        <div v-if="project.coverImage" class="rounded-t-lg overflow-hidden">
          <NuxtImg :src="project.coverImage" :alt="project.title" />
        </div>
      </NuxtLink>
    </template>

    <template #footer>
      <p class="text-muted text-sm leading-relaxed mb-2">
        {{ project.description }}
      </p>
      <div class="flex justify-end gap-2">
        <UButton
          v-if="project.slug"
          label="Read More"
          color="primary"
          variant="soft"
          size="xs"
          :to="`/projects/${project.slug}`"
          icon="i-lucide-book-open"
        />
        <UButton
          v-if="project.liveUrl"
          label="Live URL"
          color="primary"
          variant="soft"
          size="xs"
          :to="project.liveUrl"
          target="_blank"
          icon="i-lucide-external-link"
        />
        <UButton
          label="View Code"
          color="neutral"
          variant="soft"
          size="xs"
          :to="project.github"
          target="_blank"
          icon="i-simple-icons-github"
        />
      </div>
    </template>
  </UPageCard>
</template>

<script setup lang="ts">
import type { ProjectsCollectionItem } from '@nuxt/content';

defineProps<{ project: ProjectsCollectionItem }>();
</script>

<template>
  <FloatingCard class="h-full">
    <div
      class="h-full flex flex-col rounded-2xl bg-[var(--ui-bg-elevated)] border border-white/10 p-5 gap-4"
    >
      <!-- Header -->
      <div class="flex justify-between items-center">
        <h3 class="font-bold text-lg text-primary">{{ project.title }}</h3>
        <div class="flex items-center gap-1">
          <UBadge
            v-if="project.installs"
            color="primary"
            variant="subtle"
            size="xs"
            icon="i-lucide-download"
          >
            {{ project.installs >= 1000 ? `${+(project.installs / 1000).toFixed(1)}k+` : project.installs }}
          </UBadge>
          <UButton
            v-if="project.github"
            icon="i-simple-icons-github"
            color="neutral"
            variant="ghost"
            :to="project.github"
            target="_blank"
          />
        </div>
      </div>

      <div v-if="project.stack" class="flex flex-wrap gap-2">
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

      <!-- Body -->
      <NuxtLink
        :to="project.slug ? `/projects/${project.slug}` : undefined"
        class="block"
        :class="{ 'pointer-events-none': !project.slug }"
      >
        <FloatingCard
          v-if="project.coverImage"
          :rotate-depth="8"
          :translate-depth="10"
        >
          <div class="rounded-lg overflow-hidden">
            <NuxtImg :src="project.coverImage" :alt="project.title" />
          </div>
        </FloatingCard>
      </NuxtLink>

      <!-- Footer -->
      <div class="mt-auto">
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
      </div>
    </div>
  </FloatingCard>
</template>

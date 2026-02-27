<script setup lang="ts">
defineProps<{ project: Project }>();
</script>

<template>
  <UCard
    class="hover:ring-2 hover:ring-primary-500 transition-all cursor-pointer h-full flex flex-col"
  >
    <template #header>
      <div class="flex items-center justify-between">
        <h3 class="font-bold text-lg text-primary">{{ project.name }}</h3>
        <UButton
          v-if="project.github"
          icon="i-simple-icons-github"
          color="neutral"
          variant="ghost"
          :to="project.github"
          target="_blank"
          @click.stop
        />
      </div>
    </template>

    <div
      v-if="project.imageUrl"
      class="-mt-4 -mx-4 mb-4 rounded-t-lg overflow-hidden"
    >
      <NuxtImg
        :src="project.imageUrl"
        :alt="project.name"
        class="w-full h-48 object-cover"
      />
    </div>

    <p class="text-muted text-sm leading-relaxed mb-4">
      {{ project.description }}
    </p>

    <div v-if="project.stack" class="flex flex-wrap gap-2 mb-4 mt-auto">
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

    <template #footer>
      <div class="flex justify-end gap-2">
        <UButton
          v-if="project.liveUrl"
          label="Live Demo"
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
  </UCard>
</template>

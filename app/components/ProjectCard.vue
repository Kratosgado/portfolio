<script setup lang="ts">
import type { PropType } from 'vue'

defineProps({
  project: {
    type: Object as PropType<{
      name: string
      description: string
      github: string
    }>,
    required: true
  }
})
</script>

<template>
  <UCard class="hover:ring-2 hover:ring-primary-500 transition-all cursor-pointer h-full flex flex-col" :ui="{ body: { base: 'flex-1' } }">
    <template #header>
      <div class="flex items-center justify-between">
        <h3 class="font-bold text-lg text-primary">{{ project.name }}</h3>
        <UButton
          v-if="project.github"
          icon="i-simple-icons-github"
          color="gray"
          variant="ghost"
          :to="project.github"
          target="_blank"
          @click.stop
        />
      </div>
    </template>
    
    <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">
      {{ project.description }}
    </p>

    <template #footer>
      <div class="flex justify-end">
        <UButton
          label="View Code"
          color="primary"
          variant="soft"
          size="xs"
          :to="project.github"
          target="_blank"
          icon="i-lucide-external-link"
        />
      </div>
    </template>
  </UCard>
</template>

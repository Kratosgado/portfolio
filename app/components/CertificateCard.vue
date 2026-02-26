<script setup lang="ts">
import type { PropType } from 'vue'

defineProps({
  certificate: {
    type: Object as PropType<{
      name: string
      organization: string
      date: string
      skills?: string
      credential?: string
    }>,
    required: true
  }
})
</script>

<template>
  <UCard class="hover:ring-2 hover:ring-primary-500 transition-all h-full flex flex-col" :ui="{ body: { base: 'flex-1' } }">
    <template #header>
      <div class="flex items-start justify-between gap-4">
        <div>
          <h3 class="font-bold text-lg text-primary">{{ certificate.name }}</h3>
          <p class="text-sm text-gray-500 dark:text-gray-400">{{ certificate.organization }} • {{ certificate.date }}</p>
        </div>
      </div>
    </template>
    
    <p v-if="certificate.skills" class="text-gray-600 dark:text-gray-300 text-sm mt-2">
      <span class="font-semibold">Skills:</span> {{ certificate.skills }}
    </p>

    <template #footer>
      <div class="flex justify-end">
        <UButton
          v-if="certificate.credential"
          label="View Credential"
          color="gray"
          variant="ghost"
          size="xs"
          :to="certificate.credential"
          target="_blank"
          icon="i-lucide-external-link"
        />
      </div>
    </template>
  </UCard>
</template>

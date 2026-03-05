<script setup lang="ts">
import type { CertificatesCollectionItem } from '@nuxt/content';

defineProps<{ certificate: CertificatesCollectionItem }>();
</script>

<template>
  <UPageCard
    class="hover:ring-2 hover:ring-primary-500 transition-all h-full flex flex-col"
    spotlight
  >
    <template #header>
      <div class="flex items-start justify-between gap-4">
        <div>
          <h3 class="font-bold text-lg text-primary">{{ certificate.name }}</h3>
          <p class="text-sm text-muted">
            {{ certificate.organization }} • {{ certificate.date }}
          </p>
        </div>
      </div>
    </template>

    <p v-if="certificate.skills" class="text-muted text-sm mt-2">
      <span class="font-semibold">Skills:</span> {{ certificate.skills }}
    </p>

    <template #footer>
      <div class="flex justify-end">
        <UButton
          v-if="certificate.credential"
          label="View Credential"
          color="neutral"
          variant="ghost"
          size="xs"
          :to="certificate.credential"
          target="_blank"
          icon="i-lucide-external-link"
        />
      </div>
    </template>
  </UPageCard>
</template>

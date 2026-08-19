<script setup lang="ts">
import type { CertificatesCollectionItem } from '@nuxt/content';

defineProps<{ certificate: CertificatesCollectionItem }>();
</script>

<template>
  <FloatingCard class="h-full">
    <div
      class="h-full flex flex-col rounded-2xl bg-[var(--ui-bg-elevated)] border border-white/10 p-5 gap-3"
    >
      <div class="flex items-start justify-between gap-4">
        <div>
          <h3 class="font-bold text-lg text-primary">{{ certificate.name }}</h3>
          <p class="text-sm text-muted">
            {{ certificate.organization }} • {{ certificate.date }}
          </p>
        </div>
      </div>

      <p v-if="certificate.skills" class="text-muted text-sm">
        <span class="font-semibold">Skills:</span> {{ certificate.skills }}
      </p>

      <div class="mt-auto flex justify-end">
        <UButton
          v-if="certificate.credential"
          label="View Credential"
          variant="soft"
          size="sm"
          :to="certificate.credential"
          target="_blank"
          icon="i-lucide-external-link"
        />
      </div>
    </div>
  </FloatingCard>
</template>

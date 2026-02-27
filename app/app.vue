<script setup>
useHead({
  meta: [{ name: 'viewport', content: 'width=device-width, initial-scale=1' }],
  link: [{ rel: 'icon', href: '/favicon.ico' }],
  htmlAttrs: {
    lang: 'en',
  },
});

const title = 'Prince Mbeah Essilfie - Portfolio';

useSeoMeta({
  title,
  description: profile.bio,
  ogTitle: title,
  ogDescription: profile.bio,
  twitterCard: 'summary_large_image',
});
</script>

<template>
  <UApp>
    <UHeader>
      <template #left>
        <NuxtLink
          to="/"
          class="font-bold text-xl flex flex-row items-center gap-2"
        >
          <NuxtImg
            src="/images/favicon.webp"
            alt="Profile Picture"
            class="rounded-full"
            width="40"
            height="40"
          />
          {{ profile.username }}
        </NuxtLink>
      </template>

      <UNavigationMenu
        :items="[
          {
            label: 'Projects',
            to: '/#projects',
            icon: 'simple-icons:codeproject',
            active: false,
          },
          {
            label: 'Certifications',
            to: '/#certifications',
            icon: 'simple-icons:udemy',
            active: false,
          },
        ]"
      />

      <template #right>
        <UColorModeButton />

        <UButton
          :to="profile.github"
          target="_blank"
          icon="i-simple-icons-github"
          aria-label="GitHub"
          color="neutral"
          variant="ghost"
        />
        <UButton
          :to="profile.linkedin"
          target="_blank"
          icon="i-simple-icons-linkedin"
          aria-label="GitHub"
          color="neutral"
          variant="ghost"
        />
      </template>
    </UHeader>

    <UMain>
      <NuxtPage />
    </UMain>

    <USeparator icon="i-simple-icons-nuxtdotjs" />

    <UFooter>
      <template #left>
        <p class="text-sm text-muted">
          © {{ new Date().getFullYear() }} {{ profile.username }}
        </p>
      </template>

      <template #right>
        <UButton
          :to="profile.github"
          target="_blank"
          icon="i-simple-icons-github"
          aria-label="GitHub"
          color="neutral"
          variant="ghost"
        />
        <UButton
          :to="profile.linkedin"
          target="_blank"
          icon="i-simple-icons-linkedin"
          aria-label="LinkedIn"
          color="neutral"
          variant="ghost"
        />
      </template>
    </UFooter>
  </UApp>
</template>

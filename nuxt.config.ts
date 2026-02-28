// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/ui', '@nuxt/image', 'nuxt-studio', '@nuxt/content'],

  devtools: {
    enabled: true,
  },

  css: ['~/assets/css/main.css'],

  routeRules: {
    '/': { prerender: true },
  },
  future: {
    compatibilityVersion: 4,
  },

  compatibilityDate: '2025-01-15',

  nitro: {
    preset: 'vercel',
    prerender: {
      routes: ['/'],
      crawlLinks: true,
    },
  },
  studio: {
    repository: {
      provider: 'github',
      owner: 'Kratosgado',
      repo: 'portfolio',
      branch: 'main',
    },
  },
});

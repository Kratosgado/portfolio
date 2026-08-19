// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  colorMode: {
    fallback: 'dark',
    preference: 'dark',
  },
  compatibilityDate: '2025-01-15',

  components: [{ path: '~/components', pathPrefix: false }],

  css: ['~/assets/css/main.css'],

  future: {
    compatibilityVersion: 4,
  },

  modules: ['@nuxt/ui', '@nuxt/image', 'nuxt-studio', '@nuxt/content', 'motion-v/nuxt'],

  nitro: {
    prerender: {
      crawlLinks: true,
      routes: ['/'],
    },
    preset: process.env.NITRO_PRESET ?? 'vercel',
  },

  routeRules: {
    '/': { prerender: true },
    '/resume': { prerender: true },
    '/resume/**': { prerender: true },
  },

  studio: {
    repository: {
      branch: 'main',
      owner: 'Kratosgado',
      provider: 'github',
      repo: 'portfolio',
    },
  },

  vite: {
    build: {
      chunkSizeWarningLimit: 4000,
    },
  },
});

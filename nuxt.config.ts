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

  modules: ['@nuxt/ui', '@nuxt/image', 'nuxt-studio', '@nuxt/content', '@tresjs/nuxt'],

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

  vue: {
    compilerOptions: {
      isCustomElement: (tag: string) => tag.startsWith('Tres') && tag !== 'TresCanvas',
    },
  },

  vite: {
    build: {
      chunkSizeWarningLimit: 4000,
    },
  },
});

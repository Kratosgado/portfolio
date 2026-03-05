// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-01-15',

  css: ['~/assets/css/main.css'],

  future: {
    compatibilityVersion: 4,
  },
  modules: ['@nuxt/ui', '@nuxt/image', 'nuxt-studio', '@nuxt/content'],

  nitro: {
    prerender: {
      crawlLinks: true,
      routes: ['/'],
    },
    preset: 'vercel',
  },

  routeRules: {
    '/': { prerender: true },
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
      rollupOptions: {
        output: {
          manualChunks: {
            vendor: [
              'vue',
              'vue-router',
              // 'zod',
            ],
          },
        },
      },
    },
  },
});

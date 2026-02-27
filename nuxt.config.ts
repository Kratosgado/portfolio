// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/ui', '@nuxt/image'],

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
    preset: 'github_pages',
  },
});

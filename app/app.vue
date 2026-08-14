<script setup lang="ts">
const { data: profile } = await useProfile();

useHead({
  htmlAttrs: {
    class: 'dark',
    lang: 'en',
  },
  link: [{ href: '/images/favicon.webp', rel: 'icon' }],
  meta: [{ content: 'width=device-width, initial-scale=1', name: 'viewport' }],
});

const title = 'Prince Mbeah Essilfie - Software Engineer';

useSeoMeta({
  description: computed(() => profile.value?.bio),
  ogDescription: computed(() => profile.value?.bio),
  ogTitle: title,
  title,
  twitterCard: 'summary_large_image',
});

// Floating nav scroll state
const isScrolled = ref(false);
const showScrollTop = ref(false);

onMounted(() => {
  const handleScroll = () => {
    isScrolled.value = window.scrollY > 50;
    showScrollTop.value = window.scrollY > window.innerHeight;
  };
  window.addEventListener('scroll', handleScroll, { passive: true });
  onUnmounted(() => window.removeEventListener('scroll', handleScroll));
});

function scrollToTop() {
  window.scrollTo({ behavior: 'smooth', top: 0 });
}

const navItems = [
  { href: '/#about', label: 'About' },
  { href: '/#experience', label: 'Experience' },
  { href: '/#projects', label: 'Projects' },
  { external: true, href: 'https://blog.bitshiftdevs.com', label: 'Blog' },
  { href: '/resume', label: 'Resume' },
];
</script>

<template>
  <div
    v-if="profile"
    class="min-h-screen bg-[var(--color-bg-base)] text-[var(--color-text-primary)]"
  >
    <!-- Floating Navigation -->
    <nav
      :class="['floating-nav', { scrolled: isScrolled }]"
      aria-label="Main navigation"
    >
      <div class="flex items-center gap-6">
        <NuxtLink
          to="/"
          class="font-heading font-bold text-lg hover:text-[var(--color-accent-start)] transition-colors"
        >
          {{ profile.username }}
        </NuxtLink>

        <div class="hidden md:flex items-center gap-4">
          <template v-for="item in navItems" :key="item.label">
            <a
              v-if="item.external"
              :href="item.href"
              target="_blank"
              rel="noopener noreferrer"
              class="text-sm text-[var(--color-text-secondary)] hover:text-[var(--color-text-primary)] transition-colors"
            >
              {{ item.label }}
            </a>
            <NuxtLink
              v-else
              :to="item.href"
              class="text-sm text-[var(--color-text-secondary)] hover:text-[var(--color-text-primary)] transition-colors"
            >
              {{ item.label }}
            </NuxtLink>
          </template>
        </div>

        <a
          :href="profile.github"
          target="_blank"
          rel="noopener noreferrer"
          class="text-[var(--color-text-secondary)] hover:text-[var(--color-text-primary)] transition-colors"
          aria-label="GitHub"
        >
          <UIcon name="i-simple-icons-github" class="size-5" />
        </a>
      </div>
    </nav>

    <!-- Page Content -->
    <NuxtPage :transition="{ name: 'page', mode: 'out-in' }" />

    <!-- Scroll to Top -->
    <Transition name="fade">
      <button
        v-show="showScrollTop"
        class="fixed bottom-8 right-8 z-50 p-3 rounded-full bg-[var(--color-bg-elevated)] border border-white/10 hover:border-[var(--color-accent-start)] hover:shadow-[0_0_20px_rgba(217,119,6,0.3)] transition-all duration-300 cursor-pointer"
        aria-label="Scroll to top"
        @click="scrollToTop"
      >
        <UIcon name="i-lucide-chevron-up" class="size-5" />
      </button>
    </Transition>

    <!-- Minimal Footer -->
    <footer
      class="py-8 text-center text-[var(--color-text-muted)] text-sm border-t border-white/5"
    >
      <p>
        © {{ new Date().getFullYear() }} {{ profile.username }} • Built with
        Nuxt
      </p>
    </footer>
  </div>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>

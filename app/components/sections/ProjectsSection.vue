<script setup lang="ts">
import type { ProjectsCollectionItem } from '@nuxt/content';

const props = defineProps<{
  projects: ProjectsCollectionItem[];
}>();

// Featured project slugs (from resume)
const featuredSlugs = ['pseudo-runner', 'nasm-compiler-for-linux', 'liquibase-runner', 'hurl-plus', 'rust-sqlite'];

const categories = [
  { label: 'All', value: 'all' },
  { label: 'VS Code Extensions', value: 'vscode-extension' },
  { label: 'Web Apps', value: 'web' },
  { label: 'Neovim Plugins', value: 'neovim' },
  { label: 'Mobile', value: 'mobile' },
  { label: 'Tools', value: 'tool' },
];

const activeCategory = ref('all');
const searchQuery = ref('');
const showCount = ref(8);

const filteredProjects = computed(() => {
  let result = props.projects;

  if (activeCategory.value !== 'all') {
    result = result.filter((p) => {
      const type = (p.toolType ?? '').toLowerCase();
      const stack = (p.stack ?? []).map((s: string) => s.toLowerCase());
      const cat = activeCategory.value;

      if (cat === 'vscode-extension') return type.includes('vscode') || type.includes('extension');
      if (cat === 'neovim') return type.includes('neovim') || stack.some((s: string) => s.includes('neovim') || s.includes('lua'));
      if (cat === 'web') return type.includes('web') || stack.some((s: string) => s.includes('vue') || s.includes('nuxt') || s.includes('react') || s.includes('angular'));
      if (cat === 'mobile') return type.includes('mobile') || stack.some((s: string) => s.includes('flutter') || s.includes('kotlin'));
      if (cat === 'tool') return type.includes('tool') || type.includes('cli');
      return true;
    });
  }

  if (searchQuery.value.trim()) {
    const q = searchQuery.value.toLowerCase();
    result = result.filter(
      (p) =>
        (p.title ?? '').toLowerCase().includes(q) ||
        (p.description ?? '').toLowerCase().includes(q) ||
        (p.stack ?? []).some((s: string) => s.toLowerCase().includes(q)),
    );
  }

  return result;
});

const featuredProjects = computed(() =>
  filteredProjects.value.filter((p) => featuredSlugs.includes(p.slug ?? '')),
);

const regularProjects = computed(() =>
  filteredProjects.value.filter((p) => !featuredSlugs.includes(p.slug ?? '')),
);

const visibleRegular = computed(() => regularProjects.value.slice(0, showCount.value));
const hasMore = computed(() => regularProjects.value.length > showCount.value);

function loadMore() {
  showCount.value += 6;
}

// Tilt effect on hover
function handleMouseMove(event: MouseEvent) {
  const card = (event.currentTarget as HTMLElement);
  const rect = card.getBoundingClientRect();
  const x = event.clientX - rect.left;
  const y = event.clientY - rect.top;
  const centerX = rect.width / 2;
  const centerY = rect.height / 2;
  const rotateX = ((y - centerY) / centerY) * -3;
  const rotateY = ((x - centerX) / centerX) * 3;
  card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale(1.02)`;
}

function handleMouseLeave(event: MouseEvent) {
  const card = (event.currentTarget as HTMLElement);
  card.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) scale(1)';
}

onMounted(async () => {
  const { gsap } = await import('gsap');
  const { ScrollTrigger } = await import('gsap/ScrollTrigger');
  gsap.registerPlugin(ScrollTrigger);

  gsap.from('.project-card', {
    y: 40,
    opacity: 0,
    duration: 0.6,
    stagger: 0.1,
    ease: 'power3.out',
    scrollTrigger: {
      trigger: '#projects',
      start: 'top 70%',
      once: true,
    },
  });
});
</script>

<template>
  <section id="projects" class="section-viewport max-w-7xl mx-auto">
    <!-- Section Header -->
    <div class="mb-12 text-center">
      <h2 class="section-title gradient-text">Projects</h2>
      <p class="section-subtitle mx-auto">Tools, apps, and systems I've built.</p>
    </div>

    <!-- Filters -->
    <div class="flex flex-col sm:flex-row items-center justify-center gap-4 mb-10">
      <!-- Category Pills -->
      <div class="flex flex-wrap justify-center gap-2">
        <button
          v-for="cat in categories"
          :key="cat.value"
          :class="[
            'px-4 py-1.5 rounded-full text-sm font-medium transition-all duration-300 cursor-pointer',
            activeCategory === cat.value
              ? 'bg-gradient-to-r from-[var(--color-accent-start)] to-[var(--color-accent-end)] text-white shadow-[0_0_20px_rgba(217,119,6,0.3)]'
              : 'bg-white/5 text-[var(--color-text-secondary)] hover:bg-white/10 hover:text-[var(--color-text-primary)] border border-white/10',
          ]"
          @click="activeCategory = cat.value"
        >
          {{ cat.label }}
        </button>
      </div>

      <!-- Search -->
      <div class="relative">
        <UIcon name="i-lucide-search" class="absolute left-3 top-1/2 -translate-y-1/2 size-4 text-[var(--color-text-muted)]" />
        <input
          v-model="searchQuery"
          type="text"
          placeholder="Search projects..."
          class="pl-10 pr-4 py-2 rounded-full bg-white/5 border border-white/10 text-sm text-[var(--color-text-primary)] placeholder:text-[var(--color-text-muted)] focus:outline-none focus:border-[var(--color-accent-start)] focus:shadow-[0_0_15px_rgba(217,119,6,0.2)] transition-all w-64"
        />
      </div>
    </div>

    <!-- Featured Projects -->
    <div v-if="featuredProjects.length" class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
      <div
        v-for="project in featuredProjects"
        :key="project.slug ?? project.title"
        class="project-card glass-card p-6 group transition-all duration-300 cursor-pointer"
        @click="navigateTo(`/projects/${project.slug}`)"
        @mousemove="handleMouseMove"
        @mouseleave="handleMouseLeave"
      >
        <!-- Featured badge -->
        <div class="flex items-center justify-between mb-3">
          <span class="text-xs font-mono px-2 py-0.5 rounded-full bg-[var(--color-accent-start)]/20 text-[var(--color-accent-start)]">
            ★ Featured
          </span>
          <div class="flex items-center gap-2">
            <span
              v-if="project.installs"
              class="text-xs text-[var(--color-text-muted)] flex items-center gap-1"
            >
              <UIcon name="i-lucide-download" class="size-3" />
              {{ project.installs >= 1000 ? `${+(project.installs / 1000).toFixed(1)}k` : project.installs }}
            </span>
          </div>
        </div>

        <h3 class="text-xl font-heading font-bold text-[var(--color-text-primary)] group-hover:text-[var(--color-accent-start)] transition-colors">
          {{ project.title }}
        </h3>
        <p class="text-sm text-[var(--color-text-secondary)] mt-2 line-clamp-2">{{ project.description }}</p>

        <!-- Stack -->
        <div class="flex flex-wrap gap-1.5 mt-4">
          <span
            v-for="tech in (project.stack ?? []).slice(0, 5)"
            :key="tech"
            class="text-xs px-2 py-0.5 rounded-full bg-white/5 text-[var(--color-text-muted)]"
          >
            {{ tech }}
          </span>
        </div>

        <!-- Links -->
        <div class="flex items-center gap-3 mt-4 pt-3 border-t border-white/5">
          <span class="text-xs text-[var(--color-text-muted)] group-hover:text-[var(--color-accent-start)] transition-colors flex items-center gap-1">
            View Project <UIcon name="i-lucide-arrow-right" class="size-3" />
          </span>
        </div>
      </div>
    </div>

    <!-- Regular Projects -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
      <div
        v-for="project in visibleRegular"
        :key="project.slug ?? project.title"
        class="project-card glass-card p-5 group transition-all duration-300 cursor-pointer"
        @click="navigateTo(`/projects/${project.slug}`)"
        @mousemove="handleMouseMove"
        @mouseleave="handleMouseLeave"
      >
        <div class="flex items-center justify-between mb-2">
          <h3 class="text-base font-heading font-bold text-[var(--color-text-primary)] group-hover:text-[var(--color-accent-start)] transition-colors">
            {{ project.title }}
          </h3>
          <div class="flex items-center gap-1">
            <a
              v-if="project.github"
              :href="project.github"
              target="_blank"
              rel="noopener noreferrer"
              class="text-[var(--color-text-muted)] hover:text-[var(--color-text-primary)] transition-colors"
              @click.stop
            >
              <UIcon name="i-simple-icons-github" class="size-4" />
            </a>
            <a
              v-if="project.liveUrl"
              :href="project.liveUrl"
              target="_blank"
              rel="noopener noreferrer"
              class="text-[var(--color-text-muted)] hover:text-[var(--color-accent-start)] transition-colors"
              @click.stop
            >
              <UIcon name="i-lucide-external-link" class="size-4" />
            </a>
          </div>
        </div>
        <p class="text-sm text-[var(--color-text-secondary)] line-clamp-2">{{ project.description }}</p>
        <div class="flex flex-wrap gap-1 mt-3">
          <span
            v-for="tech in (project.stack ?? []).slice(0, 4)"
            :key="tech"
            class="text-xs px-2 py-0.5 rounded-full bg-white/5 text-[var(--color-text-muted)]"
          >
            {{ tech }}
          </span>
        </div>
      </div>
    </div>

    <!-- No results -->
    <div
      v-if="filteredProjects.length === 0"
      class="text-center py-16 text-[var(--color-text-muted)]"
    >
      <UIcon name="i-lucide-search-x" class="size-12 mx-auto mb-4 opacity-50" />
      <p>No projects found matching your criteria.</p>
    </div>

    <!-- Load More -->
    <div v-if="hasMore" class="flex justify-center mt-10">
      <button
        class="btn-neon flex items-center gap-2"
        @click="loadMore"
      >
        <UIcon name="i-lucide-plus" class="size-4" />
        Load More Projects
      </button>
    </div>
  </section>
</template>

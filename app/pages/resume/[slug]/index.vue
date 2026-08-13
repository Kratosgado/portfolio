<script setup lang="ts">
const route = useRoute();
const slug = route.params.slug as string;

const [{ data: resume }, { data: allProjects }] = await Promise.all([
  useAsyncData(`resume-${slug}`, () => queryCollection('resumes').where('slug', '=', slug).first()),
  useAsyncData('projects-for-resume', () => queryCollection('projects').all()),
]);

if (!resume.value) {
  throw createError({ statusCode: 404, statusMessage: 'Resume not found' });
}

const liveUrlLabel: Record<string, string> = {
  cli: 'Install',
  'intellij-plugin': 'JetBrains Marketplace',
  library: 'Package',
  'neovim-plugin': 'Neovim',
  'vscode-extension': 'VS Code Marketplace',
};

const resolvedResume = computed(() => {
  if (!resume.value) return null;
  return {
    ...resume.value,
    projects: resume.value.projects.map((p) => {
      if (p.toolRef) {
        const proj = allProjects.value?.find((pr) => pr.slug === p.toolRef);
        if (proj) {
          const installSuffix = proj.installs
            ? ` (${proj.installs >= 1000 ? `${+(proj.installs / 1000).toFixed(1)}k+` : proj.installs} installs)`
            : '';
          const links = [];
          if (proj.liveUrl)
            links.push({
              label: liveUrlLabel[proj.toolType ?? ''] ?? 'Live URL',
              url: proj.liveUrl,
            });
          if (proj.github) links.push({ label: 'GitHub', url: proj.github });
          return {
            bullets: p.bullets,
            links,
            name: proj.title + installSuffix,
            year: proj.year,
          };
        }
      }
      return {
        bullets: p.bullets,
        links: p.links,
        name: p.name ?? '',
        year: p.year,
      };
    }),
  };
});

useSeoMeta({
  description: resume.value.profile.slice(0, 160),
  title: `${resume.value.header.name} – ${resume.value.title}`,
});

useHead({
  link: [
    { href: 'https://fonts.googleapis.com', rel: 'preconnect' },
    { crossorigin: '', href: 'https://fonts.gstatic.com', rel: 'preconnect' },
    {
      href: 'https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap',
      rel: 'stylesheet',
    },
  ],
});

function print() {
  const el = document.querySelector('.resume-document') as HTMLElement | null;
  if (!el) {
    window.print();
    return;
  }

  // Measure content at A4 width (794px at 96dpi)
  const prev = { maxWidth: el.style.maxWidth, width: el.style.width };
  el.style.maxWidth = '794px';
  el.style.width = '794px';
  const contentHeight = el.scrollHeight;
  el.style.maxWidth = prev.maxWidth;
  el.style.width = prev.width;

  // A4 at 96dpi minus 0.8cm top+bottom margins
  const a4Usable = 1062;
  const zoom = contentHeight > a4Usable ? Math.max(0.78, a4Usable / contentHeight) : 1;

  const style = document.createElement('style');
  style.id = '__resume-zoom';
  style.textContent = `@media print { .resume-document { zoom: ${zoom.toFixed(3)} !important; } }`;
  document.head.appendChild(style);

  window.addEventListener('afterprint', () => document.getElementById('__resume-zoom')?.remove(), { once: true });
  window.print();
}
</script>

<template>
  <div v-if="resolvedResume">
    <div
      class="no-print flex items-center justify-between max-w-195 mx-auto px-8 py-4 gap-4"
    >
      <UButton
        to="/resume"
        variant="ghost"
        icon="i-lucide-arrow-left"
        color="neutral"
      >
        All Resumes
      </UButton>
      <UButton icon="i-lucide-printer" @click="print">
        Print / Save PDF
      </UButton>
    </div>

    <ResumeDocument :resume="resolvedResume" />
  </div>
</template>

<script setup lang="ts">
defineProps<{
  resume: {
    title: string;
    header: {
      name: string;
      links: { label: string; url: string }[];
    };
    profile: string;
    education: {
      institution: string;
      degree: string;
      period: string;
      bullets: string[];
    }[];
    skills: { category: string; items: string[] }[];
    experience: {
      company: string;
      role: string;
      period: string;
      location: string;
      url?: string;
      bullets: string[];
    }[];
    projects: {
      name: string;
      year?: string;
      links: { label: string; url: string }[];
      bullets: string[];
    }[];
  };
}>();
</script>

<template>
  <div
    class="resume-document max-w-[780px] mx-auto px-8 py-8 text-[15px] leading-normal"
  >
    <div class="text-center mb-4">
      <h1 class="text-2xl font-bold uppercase tracking-wide">
        {{ resume.title }}
      </h1>
      <p class="text-base font-semibold mt-0.5">{{ resume.header.name }}</p>
      <p class="mt-1 text-xs">
        <span class="font-semibold">Relevant Links: </span>
        <template v-for="(link, i) in resume.header.links" :key="link.label">
          <span> </span>
          <a
            :href="link.url"
            target="_blank"
            class="text-blue-600 underline hover:text-blue-800"
            >{{ link.label }}</a
          >
          <span v-if="i < resume.header.links.length - 1"> | </span>
        </template>
      </p>
    </div>

    <section class="resume-section mb-3">
      <h2
        class="text-xs font-bold uppercase tracking-widest border-b border-current pb-0.5 mb-1.5"
      >
        Profile
      </h2>
      <p>{{ resume.profile }}</p>
    </section>

    <section class="resume-section mb-3">
      <h2
        class="text-xs font-bold uppercase tracking-widest border-b border-current pb-0.5 mb-1.5"
      >
        Education
      </h2>
      <div
        v-for="edu in resume.education"
        :key="edu.institution"
        class="resume-entry mb-1.5"
      >
        <div class="flex justify-between">
          <span class="font-bold">{{ edu.institution }}</span>
          <span>{{ edu.period }}</span>
        </div>
        <ul class="list-disc list-outside ml-5 mt-0.5 space-y-0.5">
          <li>{{ edu.degree }}</li>
          <li v-for="bullet in edu.bullets" :key="bullet">{{ bullet }}</li>
        </ul>
      </div>
    </section>

    <section class="resume-section mb-3">
      <h2
        class="text-xs font-bold uppercase tracking-widest border-b border-current pb-0.5 mb-1.5"
      >
        Skills
      </h2>
      <ul class="list-disc list-outside ml-5 space-y-0.5">
        <li v-for="skill in resume.skills" :key="skill.category">
          <span class="font-bold">{{ skill.category }}:</span>
          {{ skill.items.join(", ") }}
        </li>
      </ul>
    </section>

    <section class="resume-section mb-3">
      <h2
        class="text-xs font-bold uppercase tracking-widest border-b border-current pb-0.5 mb-1.5"
      >
        Work Experience
      </h2>
      <div
        v-for="exp in resume.experience"
        :key="exp.company + exp.period"
        class="resume-entry mb-2.5"
      >
        <div class="flex justify-between items-baseline">
          <span class="font-bold">{{ exp.company }}</span>
          <span>{{ exp.period }}</span>
        </div>
        <div class="flex justify-between items-baseline">
          <span class="italic">
            {{ exp.role }}
            <a
              v-if="exp.url"
              :href="exp.url"
              target="_blank"
              class="not-italic text-blue-600 underline hover:text-blue-800 ml-1"
              >(Live Url)</a
            >
          </span>
          <span>{{ exp.location }}</span>
        </div>
        <ul class="list-disc list-outside ml-5 mt-0.5 space-y-0.5">
          <li v-for="bullet in exp.bullets" :key="bullet">{{ bullet }}</li>
        </ul>
      </div>
    </section>

    <section class="resume-section mb-3">
      <h2
        class="text-xs font-bold uppercase tracking-widest border-b border-current pb-0.5 mb-1.5"
      >
        Projects
      </h2>
      <div
        v-for="project in resume.projects"
        :key="project.name"
        class="resume-entry mb-2.5"
      >
        <div class="flex justify-between items-baseline gap-2">
          <div class="font-bold">
            {{ project.name }}
            <template v-for="(link, i) in project.links" :key="link.label">
              <span class="font-normal"> | </span>
              <a
                :href="link.url"
                target="_blank"
                class="font-normal text-blue-600 underline hover:text-blue-800"
                >{{ link.label }}</a
              >
            </template>
          </div>
          <span v-if="project.year" class="shrink-0">{{ project.year }}</span>
        </div>
        <ul class="list-disc list-outside ml-5 mt-0.5 space-y-0.5">
          <li v-for="bullet in project.bullets" :key="bullet">{{ bullet }}</li>
        </ul>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
const skills = [
  'Modern C++',
  'Backend Development',
  'Database Management',
  'Flutter',
  'Dart',
  'Machine Learning/AI',
  'Git',
  'GitHub',
  'Nuxt.js',
  'Vue.js',
  'TypeScript'
]

const projects = [
  {
    name: "Pseudo Code Interpreter",
    description: "A pseudo code interpreter written in rust that interprets pseudocode file passed to it as cli argument.",
    github: "https://github.com/Kratosgado/pseudo_interpreter"
  },
  {
    name: "Smart Traffic Light System",
    description: "IoT project created with Arduino(C++) and Android(Java).",
    github: "https://github.com/Kratosgado/traffic_system"
  },
  {
    name: "Traffic Control App",
    description: "Android(Java) application that communicates with Arduino traffic light via bluetooth.",
    github: "https://github.com/Kratosgado/TrafficControlApp"
  },
  {
    name: "Pseudo Runner",
    description: "A vscode extension that runs pseudo code files in the editor. Built with Typescript.",
    github: "https://github.com/Kratosgado/pseudo-runner"
  },
  {
    name: 'Nasm Compiler for Linux',
    description: 'Vs Code Extension that automates the compilation and execution of assembly codes written in NASM.',
    github: 'https://github.com/Kratosgado/nasm-compiler-linux'
  },
  {
    name: 'Chat Backend App',
    description: "Backend app for a chat application built with NestJs, Prisma and PostgreSQL.",
    github: 'https://github.com/Kratosgado/backend-chat-app'
  },
  {
    name: 'Flutter Demo Chat App',
    description: "Built using Flutter for the frontend and integrates with Firebase for backend services.",
    github: 'https://github.com/Kratosgado/demo_chat_app'
  },
  {
    name: 'Bible Studies Wing',
    description: "Bible study app that allows users to create accounts, read bible verses, share bible verses, and connect.",
    github: 'https://github.com/Kratosgado/bible_studies_wing'
  },
  {
    name: 'Flutter Catalog',
    description: 'A practice project that explores flutter diverse packages and widgets.',
    github: 'https://github.com/Kratosgado/flutter_catalog'
  },
  {
    name: "C++ Text Editor",
    description: "A custom text editor created with c++ from scratch.",
    github: "https://github.com/Kratosgado/text-editor-cpp"
  },
  {
    name: 'Instagram Clone',
    description: "Clone of the Instagram app, built with Typescript and React Native.",
    github: 'https://github.com/Kratosgado/typescript-instaClone'
  },
  {
    name: 'AutoScroll Web Extension',
    description: 'Web extension that automatically scrolls the page for you.',
    github: 'https://github.com/Kratosgado/autoscroll-chrome-extension'
  },
  {
    name: 'VsCode Color Theme',
    description: "A color theme that combines Github dark default theme, Andromeda theme and vscode dark editor color scheme.",
    github: 'https://github.com/Kratosgado/kg-dark-theme'
  }
]
const certificates = [
  {
    name: "Using Python to Interact with the Operating System",
    organization: "Coursera",
    date: "Dec 2023",
    credential: "https://www.coursera.org/account/accomplishments/certificate/S8XAJVBEJ8LY"
  },
  {
    name: 'Crash Course on Python',
    organization: 'Coursera',
    date: 'June 2022',
    skills: "Python Programming, Basic Python Data Structures, OOP",
    credential: 'https://www.coursera.org/account/accomplishments/certificate/X43PFHMTRGLQ',
  },
  {
    name: "Data Science and Machine Learning Basic to Advanced",
    organization: "Udemy",
    date: "Oct 2023",
    skills: "Python Numpy, Pandas, Matplotlib, Scikit Learn, Data Visiualization and Preparation, ML",
    credential: "https://www.udemy.com/certificate/UC-91728505-595c-4dc7-836e-83b2d8ee298d/"
  },
  {
    name: "Complete Pandas for Absolute Beginners 2023",
    organization: "Udemy",
    date: "Nov 2023",
    skills: "Pandas",
    credential: "https://www.udemy.com/certificate/UC-0cfc2114-4c6f-43bd-a855-7b40902263ed/"
  }
]
</script>

<template>
  <div>
    <UPageHero
      title="Prince Mbeah Essilfie"
      description="Software Developer. I'm capable of creating mobile apps, handling every step from concept to deployment."
      align="left"
      orientation="horizontal"
      :links="[
        { label: 'Contact Me', to: 'mailto:mbeahessilfieprince@gmail.com', icon: 'i-lucide-mail', color: 'primary' },
        { label: 'GitHub', to: 'https://github.com/Kratosgado', target: '_blank', color: 'neutral', variant: 'subtle', icon: 'i-simple-icons-github' },
        { label: 'LinkedIn', to: 'https://www.linkedin.com/in/kratosgado', target: '_blank', color: 'neutral', variant: 'subtle', icon: 'i-simple-icons-linkedin' }
      ]"
    >
      <img src="/images/profile.webp" alt="Prince Mbeah Essilfie" class="rounded-lg shadow-lg w-full max-w-sm mx-auto" />
    </UPageHero>

    <UPageSection 
      id="skills" 
      title="Skills & Knowledge" 
      description="Technologies and tools I work with."
      align="center"
    >
       <div class="flex flex-wrap gap-3 justify-center max-w-4xl mx-auto mt-4">
         <UBadge 
           v-for="skill in skills" 
           :key="skill" 
           :label="skill" 
           size="md" 
           variant="soft"
           class="font-medium" 
         />
       </div>
    </UPageSection>

    <UPageSection 
      id="projects" 
      title="Projects" 
      description="A selection of my work across various platforms and languages."
    >
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-4">
        <ProjectCard v-for="project in projects" :key="project.name" :project="project" />
      </div>
    </UPageSection>

    <UPageSection
      id="certifications"
      title="Certifications"
      description="Continuous learning and professional development."
    >
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-6 mt-4">
        <CertificateCard v-for="cert in certificates" :key="cert.name" :certificate="cert" />
      </div>
    </UPageSection>

    <UPageCTA 
      title="Interested in working together?"
      description="Feel free to reach out via email or social media."
      :links="[{
        label: 'Send Email',
        to: 'mailto:mbeahessilfieprince@gmail.com',
        icon: 'i-lucide-mail',
        color: 'primary'
      }]"
    />
  </div>
</template>

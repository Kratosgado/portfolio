export const profile = {
  name: 'Prince Mbeah Essilfie',
  username: 'Kratosgado',
  bio: 'Software Developer specializes in building backend systems, mobile and web apps.',
  email: 'mbeahessilfieprince@gmail.com',
  location: 'Takoradi, Ghana',
  github: 'https://github.com/Kratosgado',
  linkedin: 'https://www.linkedin.com/in/kratosgado',
  website: 'https://www.kratosgado.dev',
} as const;

export const projects: Project[] = [
  {
    name: 'Pseudo Code Interpreter',
    description:
      'A pseudo code interpreter written in rust that interprets pseudocode file passed to it as cli argument.',
    github: 'https://github.com/Kratosgado/pseudo_interpreter',
  },
  {
    name: 'Smart Traffic Light System',
    description: 'IoT project created with Arduino(C++) and Android(Java).',
    github: 'https://github.com/Kratosgado/traffic_system',
  },
  {
    name: 'Traffic Control App',
    description: 'Android(Java) application that communicates with Arduino traffic light via bluetooth.',
    github: 'https://github.com/Kratosgado/TrafficControlApp',
  },
  {
    name: 'Pseudo Runner',
    description: 'A vscode extension that runs pseudo code files in the editor. Built with Typescript.',
    github: 'https://github.com/Kratosgado/pseudo-runner',
  },
  {
    name: 'Nasm Compiler for Linux',
    description: 'Vs Code Extension that automates the compilation and execution of assembly codes written in NASM.',
    github: 'https://github.com/Kratosgado/nasm-compiler-linux',
  },
  {
    name: 'Chat Backend App',
    description: 'Backend app for a chat application built with NestJs, Prisma and PostgreSQL.',
    github: 'https://github.com/Kratosgado/backend-chat-app',
  },
  {
    name: 'Flutter Demo Chat App',
    description: 'Built using Flutter for the frontend and integrates with Firebase for backend services.',
    github: 'https://github.com/Kratosgado/demo_chat_app',
  },
  {
    name: 'Bible Studies Wing',
    description:
      'Bible study app that allows users to create accounts, read bible verses, share bible verses, and connect.',
    github: 'https://github.com/Kratosgado/bible_studies_wing',
  },
  {
    name: 'Flutter Catalog',
    description: 'A practice project that explores flutter diverse packages and widgets.',
    github: 'https://github.com/Kratosgado/flutter_catalog',
  },
  {
    name: 'Instagram Clone',
    description: 'Clone of the Instagram app, built with Typescript and React Native.',
    github: 'https://github.com/Kratosgado/typescript-instaClone',
  },
  {
    name: 'AutoScroll Web Extension',
    description: 'Web extension that automatically scrolls the page for you.',
    github: 'https://github.com/Kratosgado/autoscroll-chrome-extension',
  },
  {
    name: 'VsCode Color Theme',
    description:
      'A color theme that combines Github dark default theme, Andromeda theme and vscode dark editor color scheme.',
    github: 'https://github.com/Kratosgado/kg-dark-theme',
  },
] as const;
export const certificates: Certificate[] = [
  {
    name: 'Using Python to Interact with the Operating System',
    organization: 'Coursera',
    skills: 'Python Programming, Bash Scripting',
    date: 'Dec 2023',
    credential: 'https://www.coursera.org/account/accomplishments/certificate/S8XAJVBEJ8LY',
  },
  {
    name: 'Crash Course on Python',
    organization: 'Coursera',
    date: 'June 2022',
    skills: 'Basic Python Data Structures, OOP',
    credential: 'https://www.coursera.org/account/accomplishments/certificate/X43PFHMTRGLQ',
  },
  {
    name: 'Data Science and Machine Learning Basic to Advanced',
    organization: 'Udemy',
    date: 'Oct 2023',
    skills: 'Python Numpy, Pandas, Matplotlib, Scikit Learn, Data Visiualization and Preparation, ML',
    credential: 'https://www.udemy.com/certificate/UC-91728505-595c-4dc7-836e-83b2d8ee298d/',
  },
  {
    name: 'Complete Pandas for Absolute Beginners 2023',
    organization: 'Udemy',
    date: 'Nov 2023',
    skills: 'Pandas',
    credential: 'https://www.udemy.com/certificate/UC-0cfc2114-4c6f-43bd-a855-7b40902263ed/',
  },
] as const;

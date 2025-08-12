import 'package:kratosgado/data/models/project_model.dart';

List<Project> projectList = [
  Project(
      name: "Pseudo Code Interpreter",
      description:
          "A pseudo code interpreter written in rust that interprets pseudocode file passed to it as cli argument. Handles basic operations like variable declaration, assignment, arithmetic operations, conditional statements, loops, functions, and more.",
      github: "https://github.com/Kratosgado/pseudo_interpreter"),
  Project(
      name: "Smart Traffic Light System",
      description: "IoT project created with Arduino(C++) and Android(Java).",
      github: "https://github.com/Kratosgado/traffic_system"),
  Project(
      name: "Traffic Control App",
      description:
          "Android(Java) application that communicates with Arduino traffic light via bluetooth.",
      github: "https://github.com/Kratosgado/TrafficControlApp"),
  Project(
      name: "Pseudo Runner",
      description:
          "A vscode extension that runs pseudo code files in the editor. It is built with Typescript and uses the vscode extension API to interact with the editor. It builds on the pseudo code interpreter project.",
      github: "https://github.com/Kratosgado/pseudo-runner"),
  Project(
    name: 'Nasm Compiler for Linux',
    description:
        'This is a Vs Code Extension that automates the compilation and execution of assembly codes written in NASM. It is uploaded to MarketPlace with over 2k installs.',
    github: 'https://github.com/Kratosgado/nasm-compiler-linux',
  ),
  Project(
      name: 'Chat Backend App',
      description:
          "This is a backend app for a chat application built with NestJs, Prisma and PostgreSQL. It allows users  connect with other users, create accounts, create chats and send messages and pictures which is converted into Base64 string and stored in the database.",
      github: 'https://github.com/Kratosgado/backend-chat-app'),
  Project(
    name: 'Flutter Demo Chat App',
    description:
        " The app is built using Flutter for the frontend and integrates with Firebase for backend services, including authentication, real-time database, and storage. ",
    github: 'https://github.com/Kratosgado/demo_chat_app',
  ),
  Project(
      name: 'Bible Studies Wing',
      description:
          "This is a bible study app that allows users to create accounts, read bible verses, share bible verses, and connect with other users. It is built with Flutter for the frontend and integrates with Firebase for backend services, including authentication, real-time database, and storage.",
      image: 'images/bslogo.jpg',
      github: 'https://github.com/Kratosgado/bible_studies_wing'),
  Project(
      name: 'Flutter Catalog',
      description:
          'Flutter Catalog is a my practice project that expolores flutters diverse packages, very handy catalog of beautifully designed widgets to help ease your Flutter journey. The app showcases all the available Flutter widgets including external packages',
      github: 'https://github.com/Kratosgado/flutter_catalog'),
  Project(
      name: "C++ Text Editor",
      description:
          "A custom text editor created with c++ from scratch with selection and movement of lines features and more",
      github: "https://github.com/Kratosgado/text-editor-cpp"),
  Project(
      name: 'Instagram Clone',
      description:
          "This is a clone of the Instagram app, built with Typescript and React Navive. It is a fully functioning and feature-rich application that allows users to create their own accounts, share posts, and connect with other users.",
      github: 'https://github.com/Kratosgado/typescript-instaClone'),
  Project(
      name: 'AutoScroll Web Extension',
      description:
          'This is a web extension that automatically scrolls the page for you and capable of visiting subpages.',
      github: 'https://github.com/Kratosgado/autoscroll-chrome-extension'),
  Project(
      name: 'VsCode Color Theme',
      description:
          "A color theme that combines Github dark default theme, Andromeda theme and vscode dark editor color scheme. It is a very beautiful theme that is easy on the eyes.",
      github: 'https://github.com/Kratosgado/kg-dark-theme'),
];

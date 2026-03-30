---
title: Kratos Chat
coverImage: https://image2url.com/r2/default/images/1774865798254-12aa3de8-c066-4997-bfe9-d658e97bd842.png
description: Full featured Chat app with voice and video calls feature
github: https://github.com/kratosgado/chatapp
images:
  - https://image2url.com/r2/default/images/1774865732629-481c876e-b06a-4229-90ba-81773d46eae5.png
  - https://image2url.com/r2/default/images/1774865773848-b44133e1-5d0f-42eb-8942-4aa16ee1e24d.png
  - https://image2url.com/r2/default/images/1774865798254-12aa3de8-c066-4997-bfe9-d658e97bd842.png
  - https://image2url.com/r2/default/images/1774865832196-e0c7d7bd-a04d-46a3-93ad-167f34246fdf.png
  - https://image2url.com/r2/default/images/1774865863500-446f5e3a-8568-4fa3-9729-1d72a7cc6a18.png
  - /images/kratoschat.png
liveUrl: https://gachat-67v.pages.dev/
rank: 2
seo:
  title: Kratos Chat file
  description: F
slug: kratos-chat
stack:
  - Kotlin
  - Springboot
  - Liquibase
  - Websocket
  - WebRTC
  - Vue
  - NuxtUI
---

# Kratos Chat

> ![Springboot Logo](https://img.shields.io/badge/Spring%20Boot-3.4.1-green.svg "Spring Boot"){.w-50 height="50" width="100"} -![Frontned](https://img.shields.io/badge/Vue-3-green.svg "Vue"){.w-50 height="50" width="50"}
>
> #

This is a full-featured real-time chat application built with Spring Boot (Kotlin) and Vue 3 (TypeScript). It supports user authentication, private/group messaging, typing indicators, and WebRTC audio calls.

## Features

### Backend

- **Authentication**: JWT-based login/registration.
- **Real-time Messaging**: WebSocket (STOMP) for instant message delivery.
- **WebRTC Signaling**: Handling call offers, answers, and ICE candidates.
- **Persistence**: PostgreSQL database with JPA/Hibernate.
- **Security**: Spring Security + JWT.

### Frontend

- **Modern UI**: Built with Nuxt UI and Tailwind CSS.
- **State Management**: Pinia for reactive data handling.
- **Real-time Updates**: Live chat updates and typing status.
- **Voice Calls**: WebRTC integration for peer-to-peer audio calls.

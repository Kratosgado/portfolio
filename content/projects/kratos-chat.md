---
title: Kratos Chat file
description: Full featured Chat app with voice and video calls feature
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
coverImage: /images/kratoschat.png
github: https://github.com/kratosgado/chatapp
liveUrl: https://gachat-67v.pages.dev/
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

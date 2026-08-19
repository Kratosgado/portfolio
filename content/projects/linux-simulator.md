---
title: Linux Simulator
coverImage: https://placehold.co/1200x600
description: A browser-based, offline-first Linux desktop simulator for beginners — window manager, file manager, text editor, terminal, and guided lessons over one shared virtual filesystem.
github: https://github.com/Kratosgado/linux-simulator
images:
  - https://placehold.co/800x400
liveUrl: https://linux-sim.netlify.app
navigation:
  icon: i-lucide-search
rank: 3
slug: linux-simulator
resumeBullets:
  - Built a browser-based, offline-first Linux desktop simulator for beginners — a full desktop environment (window manager, file manager, text editor, terminal) rather than a plain terminal emulator, all sharing one virtual filesystem.
  - Designed a two-layer architecture: a framework-free TypeScript OS shell (window manager, desktop, taskbar) hosting Svelte 5 apps mounted per-window, communicating through a shared context (VFS instance, current user, event bus, persistence layer).
  - Implemented a virtual filesystem persisted to IndexedDB with debounced writes, plus a guided lesson system for teaching terminal fundamentals, packaged as an installable, fully offline static site via a service worker.
stack:
  - Svelte
  - TypeScript
  - Tailwind CSS
  - IndexedDB
---

## Overview

Linux Simulator is a browser-based, offline-first simulation of a Linux desktop environment aimed at complete beginners. Rather than just emulating a terminal, it recreates a full desktop experience — a window manager, file manager, text editor, and terminal — all operating on one shared virtual filesystem, with a guided lesson system for learners who have never touched a terminal before.

## Features

- **Full Desktop Environment**: Window manager, desktop surface, and taskbar, not just a terminal window.
- **Shared Virtual Filesystem**: Terminal, file manager, and text editor all read and write the same VFS.
- **Guided Lessons**: Structured lessons teach terminal fundamentals, or learners can explore freely.
- **Offline-First & Persistent**: Ships as a static site with a service worker; the filesystem and session state persist locally via IndexedDB and localStorage, so closing and reopening the tab resumes exactly where you left off.

## Technologies Used

- **Svelte 5**: Powers the apps mounted inside windows (Terminal, File Manager, Text Editor, Lessons, Settings), compiled away at build time with no runtime overhead.
- **TypeScript**: Used throughout, including a framework-free OS shell for window management and desktop chrome.
- **Tailwind CSS**: Utility-driven styling for app and shell UI.
- **IndexedDB**: Persists the virtual filesystem with debounced writes.

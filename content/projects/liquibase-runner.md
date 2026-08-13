---
title: Liquibase Runner
coverImage: https://placehold.co/1200x600
description: A VS Code extension for managing Liquibase database migrations, with a sidebar tree view, live dashboard panel, and auto-detected Maven/Gradle/CLI setups.
github: https://github.com/Kratosgado/liquibase-runner
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 4
slug: liquibase-runner
toolType: vscode-extension
resumeBullets:
  - Developed a VS Code extension in TypeScript for managing Liquibase database migrations directly from the editor, later ported to Neovim as liquibase.nvim.
  - Built a sidebar changelog/changeset tree view and a live dashboard panel surfacing migration status, with the full Liquibase command set (update, rollback, diff, snapshot, generate).
  - Implemented auto-detection of Maven, Gradle, and standalone CLI Liquibase setups so the extension works across differently configured Java projects with no manual config.
stack:
  - TypeScript
  - VS Code Extension
  - Liquibase
---

## Overview

Liquibase Runner is a VS Code extension for managing Liquibase database migrations without leaving the editor. It auto-detects how a project runs Liquibase (Maven, Gradle, or standalone CLI) and exposes changelogs and migration commands through a sidebar and dashboard.

## Features

- **Sidebar Tree View**: Browse changelogs and changesets from the VS Code sidebar.
- **Live Dashboard Panel**: See migration status at a glance.
- **Full Command Set**: Run update, rollback, diff, snapshot, and generate commands from the editor.
- **Auto-Detected Setups**: Recognizes Maven, Gradle, and standalone CLI Liquibase configurations automatically.

## Technologies Used

- **TypeScript**: Extension logic and VS Code API integration.
- **VS Code Extension**: Built on the VS Code Extension API.
- **Liquibase**: Database migration tool the extension wraps.

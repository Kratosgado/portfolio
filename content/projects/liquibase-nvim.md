---
title: liquibase.nvim
coverImage: https://placehold.co/1200x600
description: A Neovim plugin for managing Liquibase database migrations in Java projects without leaving the editor.
github: https://github.com/Kratosgado/liquibase.nvim
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 5
slug: liquibase-nvim
toolType: neovim-plugin
resumeBullets:
  - Built a Neovim plugin in Lua for managing Liquibase database migrations in Java projects, ported from the Liquibase Runner VS Code extension.
  - Implemented a sidebar changelog/changeset tree view alongside the full Liquibase command set (update, rollback, diff, snapshot, generate) runnable directly from the editor.
stack:
  - Lua
  - Neovim Plugin
  - Liquibase
---

## Overview

liquibase.nvim brings Liquibase database migration management into Neovim, letting Java developers browse changelogs and run migration commands without switching to a terminal or IDE. It's a Neovim port of the Liquibase Runner VS Code extension.

## Features

- **Changelog/Changeset Tree**: Browse Liquibase changelogs and changesets in a sidebar.
- **Full Command Set**: Run update, rollback, diff, snapshot, and generate commands from the editor.
- **Java Project Aware**: Detects Liquibase configuration within Java projects.

## Technologies Used

- **Lua**: Neovim's native scripting language.
- **Neovim Plugin**: Built on Neovim's plugin and UI APIs.

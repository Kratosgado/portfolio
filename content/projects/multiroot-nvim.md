---
title: MultiRoot.nvim
coverImage: https://placehold.co/1200x600
description: A Neovim plugin that brings VS Code-style multi-root workspace support to Neovim.
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 5
slug: multiroot-nvim
toolType: neovim-plugin
resumeBullets:
  - Built a Neovim plugin in Lua that replicates VS Code's multi-root workspace model, letting a single Neovim session manage multiple independent project roots.
  - Implemented per-root file explorer, LSP, and buffer scoping so tooling behaves correctly across root boundaries instead of assuming a single project directory.
stack:
  - Lua
  - Neovim Plugin
---

## Overview

MultiRoot.nvim brings VS Code-style multi-root workspace support to Neovim, allowing multiple independent project directories to be managed together in a single editor session.

## Features

- **Multi-Root Workspaces**: Attach and manage several project roots at once.
- **Scoped Tooling**: File explorer, LSP, and buffer behavior respect root boundaries.
- **VS Code Parity**: Mirrors the multi-root workflow familiar to VS Code users.

## Technologies Used

- **Lua**: Neovim's native scripting language.
- **Neovim Plugin**: Built on Neovim's plugin and workspace APIs.

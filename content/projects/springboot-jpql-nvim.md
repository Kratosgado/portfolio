---
title: springboot-jpql.nvim
coverImage: https://placehold.co/1200x600
description: A Neovim plugin bringing IntelliJ-style JPA language injection to @Query annotations in Kotlin/Java Spring Data repositories.
github: https://github.com/Kratosgado/springboot-jpql.nvim
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 5
slug: springboot-jpql-nvim
toolType: neovim-plugin
resumeBullets:
  - Built a Neovim plugin in Lua bringing IntelliJ-style JPA language injection to @Query annotations in Kotlin/Java Spring Data repositories.
  - Implemented JPQL and native SQL syntax highlighting via Treesitter injections combined with otter.nvim, plus a live LSP client (sqls) for in-annotation diagnostics.
  - Added entity and field completion inside @Query strings by resolving JPA entity metadata from the surrounding Kotlin/Java codebase.
stack:
  - Lua
  - Neovim Plugin
  - Treesitter
  - Kotlin
  - Java
---

## Overview

springboot-jpql.nvim brings IntelliJ-style JPA language injection to Neovim, turning the string inside a Spring Data `@Query` annotation into a fully highlighted, LSP-backed JPQL or native SQL context.

## Features

- **JPQL/SQL Syntax Highlighting**: Highlights `@Query` string contents as JPQL or native SQL.
- **Live LSP Diagnostics**: Runs a `sqls` LSP client against `@Query` content via Treesitter injections and otter.nvim.
- **Entity/Field Completion**: Offers completion for JPA entity and field names inside query strings.
- **Kotlin & Java Support**: Works across Kotlin and Java Spring Data repositories.

## Technologies Used

- **Lua**: Neovim's native scripting language.
- **Treesitter**: Injections used to scope JPQL/SQL contexts inside annotations.
- **otter.nvim**: Provides the language-injection LSP bridging.

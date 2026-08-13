---
title: graphql-resolver.nvim
coverImage: https://placehold.co/1200x600
description: A Neovim plugin replicating IntelliJ's GraphQL-to-Spring Boot resolver navigation, with Treesitter-based support for Spring for GraphQL and Netflix DGS annotations.
github: https://github.com/Kratosgado/graphql-resolver.nvim
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 5
slug: graphql-resolver-nvim
toolType: neovim-plugin
resumeBullets:
  - Built a Neovim plugin in Lua replicating IntelliJ's GraphQL-to-Spring Boot resolver navigation, letting developers jump directly from a GraphQL schema field to its resolver method.
  - Used Treesitter queries to parse GraphQL schemas and Java/Kotlin resolver annotations, supporting both Spring for GraphQL and Netflix DGS annotation styles.
stack:
  - Lua
  - Neovim Plugin
  - Treesitter
  - GraphQL
  - Spring Boot
---

## Overview

graphql-resolver.nvim replicates IntelliJ's GraphQL-to-Spring Boot resolver navigation inside Neovim, letting you jump from a GraphQL schema field straight to the Java/Kotlin method that resolves it.

## Features

- **Resolver Navigation**: Jump from a GraphQL field to its backing resolver method.
- **Spring for GraphQL Support**: Understands `@SchemaMapping`, `@QueryMapping`, and related annotations.
- **Netflix DGS Support**: Understands DGS annotation conventions as well.
- **Treesitter-Based**: Uses Treesitter queries to parse schemas and resolver code accurately.

## Technologies Used

- **Lua**: Neovim's native scripting language.
- **Treesitter**: Powers schema and annotation parsing.
- **Neovim Plugin**: Built on Neovim's plugin APIs.

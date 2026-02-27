# Agent Guidelines for Portfolio Project

This document provides essential context and rules for AI agents working on this codebase.

## 1. Project Overview

- **Framework**: Nuxt 4 (with Vue 3 Composition API)
- **Styling**: Tailwind CSS v4, @nuxt/ui
- **Language**: TypeScript
- **Package Manager**: bun

## 2. Build & Development Commands

Use these commands to run, build, and verify the application.

| Command             | Description                                   |
| :------------------ | :-------------------------------------------- |
| `bun run dev`       | Start the development server                  |
| `bun run build`     | Build the application for production          |
| `bun run preview`   | Preview the production build                  |
| `bun run lint`      | Run Biomeint to check for code quality issues |
| `bun run typecheck` | Run Vue/TypeScript type checking              |

**Note**: There are currently no unit tests configured. Rely on `lint`, `typecheck`, and `build` to verify changes.

## 3. Code Style & Conventions

### General

- **Formatting**:
  - Indentation: 2 spaces
  - Quotes: Single quotes (`'`)
  - Semicolons: Always use semicolons
  - Trailing Commas: Yes, where valid (ES5+)
  - Line Width: 120 characters (per `biome.json`)
- **Linter**: This project uses both Biome and ESLint. Ensure code complies with the rules defined in `biome.json` .

### Vue & Nuxt

- **Component Style**: Use `<script setup lang="ts">` for all components.
- **Auto-imports**: Leverage Nuxt's auto-import feature for Vue composables (`ref`, `computed`), Nuxt utils (`useHead`, `useRoute`), and project utils (from `app/utils`). Do not manually import these unless necessary.
- **Directory Structure**:
  - Components go in `app/components/`
  - Pages go in `app/pages/`
  - Utilities and types go in `app/utils/`
  - Global styles in `app/assets/css/`
- **Naming**:
  - Components: PascalCase (e.g., `ProjectCard.vue`, `CertificateCard.vue`)
  - Composables: camelCase, prefixed with `use` (e.g., `useTheme`)
  - Prop Interfaces: Define props using `defineProps<{ ... }>()` generic syntax.

### TypeScript

- **Strictness**: Types are enforced. Avoid `any`. Use interfaces or types for data structures (e.g., `Project`, `Certificate` in `app/utils/types.ts`).
- **Data Files**: Static data should be typed and exported as `const` from `app/utils/data.ts`.

### CSS / UI

- **Tailwind**: Use utility classes for layout and spacing.
- **Nuxt UI**: Prefer `@nuxt/ui` components (e.g., `UPageHero`, `UPageSection`) over building custom UI elements from scratch when possible.
- **Icons**: Use the icon format `i-<collection>-<name>` (e.g., `i-lucide-mail`, `i-simple-icons-github`).

## 4. Error Handling

- Use `try/catch` blocks for async operations.
- Ensure UI handles loading and error states gracefully, even if basic.

## 5. Agent Workflow

1. **Analyze**: Read relevant files in `app/` to understand context.
2. **Plan**: Verify dependencies and existing patterns before writing code.
3. **Implement**: Write code following the style guides above.
4. **Verify**: Run `bun run typecheck` and `bun run lint` to ensure no regressions.
5. **Commit**: Keep changes atomic and descriptive.

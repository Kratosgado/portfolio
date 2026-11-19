# AGENTS.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Stack

Nuxt 4 (Vue 3, `<script setup lang="ts">`), Nuxt UI v4, Tailwind CSS v4, Nuxt Content v3 (SQLite via `better-sqlite3`), GSAP / motion-v for animation, `nuxt-studio` for in-browser content editing. Package manager is **bun**.

## Commands

| Command             | Purpose                                                                |
| :------------------ | :--------------------------------------------------------------------- |
| `bun run dev`       | Dev server (<http://localhost:3000>)                                     |
| `bun run build`     | Production build (`NITRO_PRESET` selects target; defaults to `vercel`) |
| `bun run preview`   | Preview the production build                                           |
| `bun run lint`      | `biome check` (formatting + lint + import/key sorting)                 |
| `bun run typecheck` | `nuxt typecheck` (vue-tsc)                                             |

There are no tests. Verify changes with `lint`, `typecheck`, and `build`.

## Architecture

**All site data lives in `content/`, not in TS files.** Collections are defined and Zod-validated in `content.config.ts`; pages read them with `queryCollection('<name>')`:

- `content/profile.json` → `profile` (name, bio, links; accessed via `useProfile()`)
- `content/projects/*.md` → `projects` (markdown pages; front matter has `rank`, `stack`, `toolType`, `installs`, `liveUrl`, `resumeBullets`, …)
- `content/certificates/*.json` → `certificates`
- `content/resumes/*.json` → `resumes` (one file per targeted resume variant, e.g. per employer/role)

Adding or changing content means editing these files to match the schema in `content.config.ts`; changing the shape means updating the schema too.

**Resumes reference projects.** In `app/pages/resume/[slug]/index.vue`, a resume `projects[]` entry with `toolRef` is resolved against the `projects` collection by `slug`: title, install count suffix, and GitHub/live links are derived from the project, while only `bullets` come from the resume. Entries without `toolRef` use their own `name`/`links`. Rendering is done by `app/components/resume/ResumeDocument.vue`; print layout is controlled entirely by the `@media print` block in `app/assets/css/main.css` (no JS toggling).

**Pages** (`app/pages/`): `index.vue` composes the landing page from `app/components/sections/*` over a client-only `SilkBackground` shader; `projects/[slug].vue`; `resume/index.vue` and `resume/[slug]/index.vue`. `/`, `/resume`, and `/resume/**` are prerendered (see `routeRules` in `nuxt.config.ts`).

**Components:** `components` is configured with `pathPrefix: false`, so `app/components/sections/HeroSection.vue` is used as `<HeroSection />`. `components/inspira/` holds vendored Inspira UI effects (WebGL/ogl shaders) that must be wrapped in `<ClientOnly>`. GSAP is registered in `app/plugins/gsap.client.ts`.

**Theme:** color mode is forced to dark (`nuxt.config.ts`); custom styling uses CSS variables like `--color-accent-start` from `app/assets/css/main.css`.

## Deployment

Two targets from the same build: Vercel (`vercel.json`, default preset) and GitHub Pages via `.github/workflows/deploy.yml` (sets `NITRO_PRESET=github_pages`, pushes `.output/public` to `Kratosgado/Kratosgado.github.io` on every push to `main`).

## Code Style

Enforced by `biome.json` (run `bun run lint`): 2-space indent, single quotes, semicolons, trailing commas, 120-col lines, **object keys sorted naturally** (`useSortedKeys`), and sorted imports. Biome only covers `app/`, `content/`, and a few root config files.

- Rely on Nuxt auto-imports (`ref`, `computed`, `useRoute`, `queryCollection`, composables in `app/composables/`); don't import them manually.
- Define props with `defineProps<{ ... }>()`; avoid `any`.
- Prefer Nuxt UI components (`UPageHero`, `UPageSection`, `UIcon`, …); icons use `i-<collection>-<name>` (e.g. `i-lucide-mail`, `i-simple-icons-github`). Only the `lucide`, `simple-icons`, and `heroicons` icon sets are installed.
- Handle loading and error states for async data (e.g. `throw createError({ statusCode: 404 })` when a content query returns nothing).

## Notes

The user's Obsidian vault is at `~/vaults` (folders such as `work/`, `web/`, `personal/`, `dailies/`). It holds their personal notes and background on their experience and projects, so consult it when writing or updating resume, project, or profile content. Treat it as private: read from it, don't copy its contents into committed files without being asked, and don't modify it.

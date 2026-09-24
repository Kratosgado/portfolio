---
title: Orbit
slug: orbit
description: Internal mission control for a small dev studio, projects, issues, sprints, secrets, and files, with an MCP server so AI agents can query and act on it, and a GitHub Action that pulls its secrets into CI.
github: https://github.com/bitshiftdevs/orbit
liveUrl: https://bitshift-orbit.vercel.app
year: "2026"
rank: 1
resumeBullets:
  - Built and run Orbit in real daily use by a small dev group, a Jira-style project/issue/sprint tracker on Nuxt 4, Nitro (deployed as Vercel serverless functions), Postgres, and Drizzle, with encrypted secrets (AES-256-GCM), audit logging, and TOTP MFA.
  - Built Orbit's MCP server (Model Context Protocol), exposing projects, issues, sprints, secrets, and search as tools so AI agents can query and act on the tracker directly instead of going through the UI.
  - Published a custom GitHub Action (bitshiftdevs/orbit/action@v1) that pulls a project's env vars and secrets from Orbit straight into CI workflows, log-masked, so no secrets live in GitHub's own settings.
stack:
  - Nuxt
  - Vue
  - Bun
  - Nitro
  - PostgreSQL
  - Drizzle
  - MCP
---

## Overview

Orbit is internal mission control for BitShift, a small dev studio, replacing Jira/GitHub Projects with something self-owned and free of GitHub Projects' 5-project limit. It's in daily real use: a small group plans sprints, tracks issues, and stores per-project secrets in it, and both AI agents and CI pipelines interact with it directly rather than through the web UI.

## AI & CI Integration

Orbit ships its own MCP (Model Context Protocol) server, a stdio-based server exposing projects, issues, sprints, secrets, search, and team data as MCP tools, authenticated with a project-scoped API token. This lets AI assistants query and modify the tracker directly as part of a conversation instead of a human relaying information through the UI.

A companion GitHub Action (`bitshiftdevs/orbit/action@v1`) fetches a project's environment variables and secrets from Orbit at the start of a CI job, masks them in the runner log, and exports them to `$GITHUB_ENV` or an optional `.env` file, so CI pipelines pull secrets from Orbit instead of duplicating them into GitHub's own secret store.

## Stack

- **Runtime**: Bun
- **Frontend**: Vue 3, Nuxt 4, Tailwind v4, Reka UI, Pinia
- **API**: Nitro (Nuxt's server engine), deployed as Vercel serverless functions
- **Database**: PostgreSQL + Drizzle ORM
- **Security**: argon2 password hashing, AES-256-GCM secrets at rest, signed session cookies, optional TOTP MFA, audit-logged secret reads

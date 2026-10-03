---
title: Runnerx
slug: runnerx
description: A student-only, hyper-local errand and delivery marketplace for Ghanaian university campuses, with a Rust backend (Actix Web, async-graphql, SeaORM) covering auth, wallets, real-time tracking, and Paystack payments.
year: "2026"
rank: 1
resumeBullets:
  - Building Runnerx's backend in Rust (Actix Web, async-graphql, SeaORM/PostgreSQL): errand lifecycle (create, accept, run, deliver, confirm, rate), wallets with Paystack-backed payments and withdrawals, and a geospatial pricing engine (base fee + distance x rate + urgency/category multipliers).
  - Implemented real-time subscriptions over WebSocket (actix-ws) for live errand status, runner location, wallet updates, and in-app chat, plus Paystack webhook handling with HMAC signature verification.
stack:
  - Rust
  - Actix Web
  - async-graphql
  - SeaORM
  - PostgreSQL
  - WebSocket
---

## Overview

Runnerx is a dispatch-first errand marketplace for students on Ghanaian university campuses (starting with KNUST): Requesters post errands, Runners accept and fulfill them, and the platform takes a transparent service fee rather than handling the underlying item cost.

## Backend

The backend is a Rust workspace (Actix Web, async-graphql, SeaORM over PostgreSQL) exposing a GraphQL API with full query, mutation, and subscription coverage across auth (Google OAuth, token refresh), the errand lifecycle, wallets, chat and messaging (including calls), push notifications, ratings, promo codes, and admin tooling. Real-time features (errand status, runner location, wallet updates, chat) run over WebSocket via `actix-ws`. Payments and payouts go through Paystack, with webhook signatures verified server-side (HMAC/SHA-256), and file storage is handled through presigned upload/download URLs.

A geospatial pricing engine (`geo-types`/`geozero`) computes delivery fees from distance, urgency, and category multipliers on top of a base fee.

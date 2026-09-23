---
title: Echo
slug: echo
description: An AI-powered study and learning app that turns any PDF into an active-recall quiz session, built with Flutter and Gemini.
github: https://github.com/Kratosgado/echo
liveUrl: https://echo.bitshiftdevs.com
year: "2026"
rank: 1
resumeBullets:
  - Built Echo's AI study-assistant feature end to end: uploads a PDF as multimodal content to Gemini (google_generative_ai), constrained with a structured JSON response schema and an explicit anti-hallucination prompt so quiz questions are grounded only in the uploaded document.
  - Designed a persistent chat session that survives app restarts by serializing conversation history to a local Isar database and replaying it back into a fresh model session on resume, so AI context isn't lost between study sessions.
  - Handled production AI reliability concerns directly, quota/rate-limit detection with user-facing messaging, auth-gated AI access, and debounced question generation triggered by page-turn events to avoid redundant API calls.
stack:
  - Flutter
  - Dart
  - Gemini
  - Firebase
  - Isar
---

## Overview

Echo is a study and learning app built with Flutter, combining habit-building tools (focus sessions, streaks, badges) with an AI-powered "active recall" feature: users upload PDF study material, and Echo generates comprehension quiz questions grounded strictly in that document using Google's Gemini API.

## AI Integration

The core AI feature uploads the PDF directly to Gemini as multimodal content and constrains generation with a structured JSON response schema, mapped straight onto a typed `QuizQuestion` model. The prompt explicitly forbids the model from using outside knowledge or hallucinating questions when a page has insufficient content, returning an empty result instead.

Chat sessions persist across app restarts: conversation history is serialized to a local Isar database and replayed back into a new `ChatSession` when a user resumes a study session, so the AI's understanding of the document carries over without re-uploading it.

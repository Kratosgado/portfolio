---
title: Git Status CLI
coverImage: https://placehold.co/1200x600
description: A Rust CLI that scans repositories for uncommitted changes and can auto-commit and push clean-up commits across multiple repos.
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 6
slug: git-status-cli
toolType: cli
resumeBullets:
  - Built a Rust CLI that recursively scans multiple repositories for uncommitted changes, surfacing a consolidated status report across an entire workspace.
  - Implemented an auto-commit-and-push mode for batch clean-up commits, reducing manual overhead when tidying many repos at once.
stack:
  - Rust
  - CLI
---

## Overview

Git Status CLI is a Rust command-line tool that scans a directory tree for git repositories with uncommitted changes, and can optionally auto-commit and push clean-up commits across all of them in one pass.

## Features

- **Multi-Repo Scanning**: Recursively finds and checks the status of every git repo under a directory.
- **Consolidated Report**: Shows uncommitted changes across all repos at a glance.
- **Auto Clean-Up Commits**: Optionally commits and pushes clean-up changes across multiple repos in one command.

## Technologies Used

- **Rust**: Systems programming language used for fast, reliable filesystem and git operations.

---
title: Rust SQLite
coverImage: https://placehold.co/1200x600
description: A SQLite implementation written in Rust, exploring database internals and storage engine design.
github: https://github.com/Kratosgado/rust-sqlite
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 5
slug: rust-sqlite
toolType: library
resumeBullets:
  - Implemented a SQLite-compatible database engine from scratch in Rust, covering page-based storage, B-tree indexing, and query execution.
  - Explored database internals including the file format, storage engine design, and on-disk data structures to deepen understanding of how relational databases work under the hood.
stack:
  - Rust
  - Databases
---

## Overview

Rust SQLite is a from-scratch implementation of SQLite's storage engine in Rust, built to explore database internals such as page-based storage, B-tree indexing, and the on-disk file format.

## Features

- **Storage Engine**: Page-based storage matching SQLite's on-disk file format.
- **B-Tree Indexing**: Implements SQLite's B-tree structures for tables and indexes.
- **Query Execution**: Parses and executes a subset of SQL against the custom storage engine.

## Technologies Used

- **Rust**: Used for its memory safety and performance in systems-level database work.

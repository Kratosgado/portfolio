---
title: Hurl+
coverImage: https://placehold.co/1200x600
description: A complete HTTP testing toolkit for .hurl files in VS Code — syntax highlighting, CodeLens execution, IntelliSense, hover docs, diagnostics, and a notebook view.
github: https://github.com/Kratosgado/hurl-plus
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 4
slug: hurl-plus
toolType: vscode-extension
resumeBullets:
  - Built Hurl+, a VS Code extension delivering a complete HTTP testing toolkit for .hurl files, including syntax highlighting, IntelliSense, hover documentation, and diagnostics.
  - Implemented CodeLens-driven request execution directly above each .hurl request block, letting developers run individual requests without leaving the editor.
  - Designed a notebook view that runs .hurl requests as individual cells, plus environment profile switching for testing against multiple configurations.
stack:
  - TypeScript
  - VS Code Extension
  - Hurl
---

## Overview

Hurl+ is a VS Code extension that turns `.hurl` files into a full HTTP testing environment, combining language tooling with an interactive notebook-style way to run requests.

## Features

- **Syntax Highlighting**: Full language support for `.hurl` files.
- **CodeLens Execution**: Run requests directly from an inline CodeLens above each block.
- **IntelliSense & Hover Docs**: Autocomplete and inline documentation for Hurl syntax.
- **Diagnostics**: Inline error reporting for malformed requests.
- **Notebook View**: Run `.hurl` requests as individual, re-runnable cells.
- **Environment Profiles**: Switch between environment configurations for the same request set.

## Technologies Used

- **TypeScript**: Extension logic and VS Code API integration.
- **VS Code Extension**: Built on the VS Code Extension, Notebook, and Language Server APIs.
- **Hurl**: The HTTP testing format the extension tools around.

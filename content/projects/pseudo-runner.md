---
title: Pseudo Runner
coverImage: https://lh3.googleusercontent.com/d/16349CIC6DYXDHTwt75gVh1bworLk95VZ
description: A VS Code extension that runs pseudo code files directly in the editor.
github: https://github.com/Kratosgado/pseudo-runner
images:
  - https://lh3.googleusercontent.com/d/16349CIC6DYXDHTwt75gVh1bworLk95VZ
  - https://image2url.com/r2/default/images/1772468076141-94683d8e-029b-4887-843f-99970e779057.png
liveUrl: https://marketplace.visualstudio.com/items?itemName=KratosGado.pseudo-runner
navigation:
  icon: i-lucide-search
rank: 2
slug: pseudo-runner
stack:
  - TypeScript
  - VS Code Extension
---

## Overview

Pseudo Runner is a VS Code extension that allows you to write and execute pseudo code directly within the editor. It provides syntax highlighting, code execution, and output display all in one place.

## Features

- **Syntax Highlighting**: Full pseudo code syntax support
- **In-Editor Execution**: Run your pseudo code without leaving VS Code
- **Output Panel**: See execution results in a dedicated output panel
- **Error Reporting**: Clear error messages with line numbers

## How It Works

The extension registers a custom language mode for `.pseudo` files and provides a built-in interpreter that parses and executes the code. Results are displayed in the VS Code output panel.

## Getting Started

1. Install the extension from the VS Code Marketplace
2. Create a new file with the `.pseudo` extension
3. Write your pseudo code
4. Press `Ctrl+Shift+P` and run "Pseudo Runner: Execute"

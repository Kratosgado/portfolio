---
title: Tabout Plugin
coverImage: https://placehold.co/1200x600
description: A JetBrains IDE plugin that replicates VS Code's tab-out behavior, letting you jump past closing brackets and quotes with Tab.
images:
  - https://placehold.co/800x400
navigation:
  icon: i-lucide-search
rank: 6
slug: tabout-plugin
toolType: intellij-plugin
resumeBullets:
  - Developed a JetBrains IDE plugin in Kotlin that replicates VS Code's "tab-out" behavior, allowing developers to jump past auto-closed brackets and quotes with the Tab key.
  - Hooked into the IntelliJ Platform's editor and typing-action APIs to detect closing-character contexts and redirect Tab input without disrupting normal indentation.
stack:
  - Kotlin
  - IntelliJ Plugin
---

## Overview

Tabout Plugin brings VS Code's familiar "tab-out" editing behavior to JetBrains IDEs, letting you press Tab to jump past auto-inserted closing brackets and quotes instead of typing over them manually.

## Features

- **Tab-Out Navigation**: Jump past closing brackets, parentheses, and quotes with Tab.
- **IntelliJ Platform Integration**: Works across JetBrains IDEs built on the IntelliJ Platform.
- **Non-Intrusive**: Falls back to normal Tab behavior outside of closing-character contexts.

## Technologies Used

- **Kotlin**: JetBrains' language for IDE plugin development.
- **IntelliJ Plugin**: Built on the IntelliJ Platform SDK.

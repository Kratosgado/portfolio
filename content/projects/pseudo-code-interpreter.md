---
title: Pseudo Code Interpreter
coverImage: https://lh3.googleusercontent.com/d/16349CIC6DYXDHTwt75gVh1bworLk95VZ
description: A pseudo code interpreter written in rust that interprets pseudocode file passed to it as cli argument.
github: https://github.com/Kratosgado/pseudo_interpreter
liveUrl: ""
navigation:
  icon: i-lucide-search
rank: 2
slug: pseudo-code-interpreter
resumeBullets:
  - Engineered a Rust CLI interpreter for pseudocode files, implementing a full lexer, parser, and AST evaluator supporting conditionals, loops, functions, and multi-dimensional arrays.
  - Published as a standalone binary and crate on crates.io, used as the runtime engine backing the Pseudo Runner VS Code extension (1.7k+ installs).
  - Designed the interpreter architecture to be embeddable, enabling tight integration with the companion TypeScript VS Code extension via native binary invocation.
stack:
  - Rust
---

## Overview

Pseudo Code Interpreter is a Rust-based tool that interprets and executes pseudo code files passed as command-line arguments. It allows developers to test their algorithms written in pseudo code.

## Features

- **Command-Line Interface**: Run pseudo code files from the terminal.
- **Interpretation**: Executes pseudo code syntax.
- **Error Handling**: Provides feedback on invalid syntax.

## Technologies Used

- **Rust**: A systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety.

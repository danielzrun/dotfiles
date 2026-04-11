---
description: Detailed rules for high-performance tooling (fd, rg, jq) and banned commands.
globs: **/*
---

## ⚡ Tooling Execution Rules

### File Exploration & Search
- **Recursive View:** Use `fd . -t f` (fastest) or `rg --files` (respects .gitignore).
- **Directory Structure:** Use `fd . -t d`.
- **Content Search:** Use `rg "pattern"`. Use `-i` for case-insensitive or `-t <type>` to filter.
- **Context:** Use `rg -C 5` to understand surrounding logic before editing.

### JSON & Data Processing
- **Primary Tool:** Use `jq`.
- **Token Efficiency:** ALWAYS use `jq -c` (compact output) to save context tokens.
- **Advanced:** Use `jaq` (Rust version) if available for heavy processing.

### 🚫 Critical Banned List
- **NO `tree`:** Not installed, use `fd . -t d`.
- **NO `find`:** Too slow, use `fd`.
- **NO `grep`:** Too slow, use `rg`.
- **NO `ls -R`:** Inefficient, use `rg --files`.
- **NO `cat | grep`:** Use `rg "pattern" filename` instead.
- **NO `ls -la` (Recursive):** Only use `ls -la` for single-directory inspection.

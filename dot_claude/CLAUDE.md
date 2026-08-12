# Project Context & Core Standards

## 🚀 Global Speed & Tooling Policy
- **Performance First:** ALWAYS prioritize high-performance tools to minimize latency.
- **Tool Preferences:**
  - Use `fd` instead of `find`.
  - Use `rg` instead of `grep`.
  - Use `jq` for JSON processing.
- **Search Strategy:** Start broad (`rg "term"`), then narrow down with context (`rg -C 5`).

## 🗣️ Language & Response Policy
- **Bilingual Mode:** Respond in **Chinese** with English technical terms in brackets.

## 📚 Detailed Rules
- Refer to `.claude/rules/` for specific tooling parameters, banned commands, and coding style guidelines.

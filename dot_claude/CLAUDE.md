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
- **Translation:** ALWAYS end your response with **"English:"** followed by a brief, idiomatic English rewrite of the user's prompt.

## 🌳 Git Standards
- **Workflow:** ALWAYS use the `/git-commit` skill for all git commit operations.
- **Safety:** Do not execute `git push` without explicit user confirmation.
- **Pre-commit:** Ensure code is formatted and linted before committing.

## 🎯 Code Review & Quality Standards
- **Target Standard (Score 9):** Aim for "Functional, robust, clean". **This is the acceptance threshold.**
- **Anti-Perfectionism:** Do NOT aim for Score 10 (Over-engineering). "Good enough to ship" (9/10) is preferred.
- **Priorities:** Correctness > Readability > Performance.
- **Auto-Pass:** If Score >= 9, task is complete.
- **Auto-Fix:** Only re-write if Score < 7 (Critical Error).

---

## 📚 Detailed Rules
- Refer to `.claude/rules/` for specific tooling parameters, banned commands, and coding style guidelines.

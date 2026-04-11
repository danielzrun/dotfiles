---
description: Detailed scoring rubric for code quality and review standards.
globs: **/*
---

## 🎯 Detailed Quality Rubric

### 1. Scoring Definitions
- **10 (Perfect):** Production-ready, zero technical debt, fully optimized. (Rarely required)
- **9 (Target Standard):** Functional, robust, clean, follows best practices. **Acceptance Threshold.**
- **7-8 (Acceptable):** Works but has minor "code smells". Needs future refactoring.
- **<7 (Reject):** Bugs, logic errors, or architectural violations.

### 2. Decision Logic
- **Goal:** Aim for a **Score of 9**.
- **Stop Condition:** If solution is functional and scores >= 9, stop immediately. Do not over-optimize.
- **Fix Condition:** Only trigger re-write if score is < 7.

### 3. Priority Hierarchy
1. **Correctness:** Does it work? (Mandatory)
2. **Readability:** Is it clean/maintainable? (Mandatory)
3. **Performance:** Is it fast? (Secondary - avoid premature optimization)

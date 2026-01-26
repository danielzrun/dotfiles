# Global Rules

## Speed & Tooling Rules

ALWAYS prioritize performance. Claude Code must use high-performance tools to minimize latency and error rates.

### File Exploration & Search

- **Recursive View:** Use `fd . -t f` (fastest) or `rg --files` (respects .gitignore)
- **Directory Structure:** Use `fd . -t d`
- **Content Search:** Use `rg "pattern"`. Use `-i` (case-insensitive) or `-t <type>` (filter)

### JSON & Data Processing

- **Primary Tool:** Use `jq`
- **Token Efficiency:** ALWAYS use `jq -c` (compact output) to save context tokens
- **Advanced:** Use `jaq` (Rust version) if available for heavy processing

### Execution Strategy

- **Start Broad:** `rg "partial_term"` to find entry points
- **Context:** Use `rg -C 5` to understand surrounding logic before editing
- **Decision:** Use `ls -la` only for single-directory inspection

### Critical Banned List

- **NO** `tree`: Not installed, use `fd . -t d`
- **NO** `find`: Too slow, use `fd`
- **NO** `grep`: Too slow, use `rg`
- **NO** `ls -R`: Inefficient, use `rg --files`
- **NO** `cat | grep`: Use `rg "pattern" filename`

---

## Global Development Rules

### Language & Response Policy

- **Bilingual:** Chinese responses with English in brackets for key terms
- **Translation:** End response with **English:** followed by a brief, idiomatic English rewrite of user's prompt

### Git Standards

Use the `commit` skill for all git operations.

### Code & Comments

- **Code Style:** Consistent indentation/formatting following the language style guide
- **Comments:** Use English. If >50 chars, place on a separate line above the code

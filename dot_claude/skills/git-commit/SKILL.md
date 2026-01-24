---
name: git-commit
description: Create git commit following Git Standards. Triggered by "commit" or "提交" keywords.
tools: Bash, Read, Git
---

# Git Commit Skill

Create git commits following Git Standards.

Extends the official `commit-commands` plugin with custom Git Standards.

## Trigger

This skill is automatically invoked when user says:
- "commit"
- "提交"
- Semantically similar phrases requesting a commit

## Git Standards

### Message Format
- **Format:** `emoji type[(scope)]: description`
- **Type mapping:**
    ✨ feat     🐛 fix      📝 docs    🎨 style    ♻️ refactor
    ⚡ perf      ✅ test     📦 build   👷 ci       🧹 chore
    ⏪ revert
- **Removal:** Use 🧹 chore (cleanup), ♻️ refactor (restructuring), or 🐛 fix (bug-related)
- **Example:** `🎨 style(config): improve theme`

### Message Requirements
- English only
- No AI signatures/watermarks

### Commit Granularity
- One commit per type[(scope)]
- Group commits with same type and scope
- If no scope, group by type only
- **Suggest scope for module-specific changes, require user approval**

## Workflow

Follow the official `commit-commands` plugin workflow:

### 1. Get Context
```bash
git status
git diff HEAD
git branch --show-current
git log --oneline -10
```

### 2. Determine Type
Analyze the changes to identify the conventional commit type:
- **feat:** New feature
- **fix:** Bug fix
- **docs:** Documentation changes
- **style:** Code style changes (formatting, no logic change)
- **refactor:** Code restructuring (no functional change)
- **perf:** Performance improvement
- **test:** Test-related changes
- **build:** Build system or dependency changes
- **ci:** CI configuration changes
- **chore:** Other changes (cleanup, maintenance)
- **revert:** Revert a previous commit

### 3. Determine Scope (Optional)
- Scope = Module/component name affected by the change
- **Always ask user before adding scope**
- If changes are project-wide or ambiguous, omit scope

### 4. Generate Commit Message
Based on type and scope analysis, propose a commit message following the format:

**Title (required):**
```
emoji type[(scope)]: description
```

**Body (optional but recommended for multi-file or complex changes):**
```
- Bullet point 1
- Bullet point 2
```

Use body when:
- More than 2 files are changed
- Changes have multiple distinct aspects
- Migration or refactoring steps need explanation

### 5. Confirm with User
```
Proposed commit message:
<message>

Changes:
<summary of staged files>

Confirm? Reply 'yes' or provide corrections.
```

### 6. Execute Commit
After user confirmation, stage and commit using allowed tools:

**For single-line message:**
```bash
git commit -m "<title>"
```

**For message with body:**
```bash
git commit -m "<title>" -m "<body>"
```

## Scope Guidelines

**Scope = Module/component name affected by the change**

| Project Type | Scope Examples |
|--------------|----------------|
| Web (Python) | api, models, views, serializers, auth, database, cache |
| Web (JS/TS) | component, hook, context, redux, router, api, utils |
| Dotfiles | starship, lazygit, nvim, git, brew, zsh, yazi, zellij |
| Config Files | nginx, apache, docker, kubernetes |
| Libraries | parser, formatter, validator, logger |

**How to identify scope:**
1. Check project structure (directories/packages)
2. Map changed files to their module
3. Use the module/directory name as scope
4. If unclear, omit scope

## Important Notes

- **NEVER execute push** - Only output the push command for user to run manually
- Always confirm commit message before executing
- Scope is optional - only suggest when it adds clarity
- Scope should match project structure (directory/module names)
- Group related changes by type and scope when possible

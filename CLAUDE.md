# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a [chezmoi](https://www.chezmoi.io/)-managed dotfiles repository for macOS development, optimized for Python/FastAPI development, modern CLI tools, and Vim workflows. The repository follows chezmoi's template-based structure where `.tmpl` files contain dynamic configuration using Go templating syntax.

## Common Commands

```bash
# Apply changes from source to home directory
chezmoi apply

# Preview what would change
chezmoi diff

# Edit a managed file (decrypts, opens in $EDITOR, re-encrypts on save)
chezmoi edit ~/.config/secrets.sh

# Add a new file to chezmoi management
chezmoi add ~/.path/to/file

# Update from remote git repository
chezmoi update

# Verify state without making changes
chezmoi verify
```

## Architecture

### Template System

 chezmoi uses Go templates (`{{ ... }}`) for dynamic configuration:

- **`dot_*.tmpl`** files become dotfiles in `$HOME` (e.g., `dot_zshrc.tmpl` → `~/.zshrc`)
- **`dot_config/**/*.tmpl`** files go to `~/.config/` (e.g., `dot_config/git/config.tmpl` → `~/.config/git/config`)
- **`run_onchange_*.sh.tmpl`** scripts execute automatically when their target file changes (hash-checked)

Key template variables:
- `{{ .chezmoi.hostname }}` - Machine hostname (used for conditional git email)
- `{{ .chezmoi.os }}` - Operating system (darwin/linux)
- `{{ .chezmoi.sourceDir }}` - Path to this repository
- `{{ template "name" . }}` - Include reusable templates from `.chezmoitemplates/`

### Directory Structure

```
├── .chezmoitemplates/     # Reusable template snippets
│   └── zsh/              # Shell configuration modules (python.zsh, modern-tools.zsh)
├── .chezmoiscripts/      # Installation and setup scripts
│   ├── run_onchange_after_darwin-install-packages.sh.tmpl  # Auto-installs CLI tools
│   └── run_once_darwin-install-casks.sh.tmpl              # Optional GUI apps installer
├── dot_config/           # XDG config directory structure
│   ├── brew/
│   │   ├── Brewfile       # Core CLI tools and lightweight utilities
│   │   └── Brewfile.casks # Large GUI applications (Ghostty, Zed, etc.)
│   ├── git/              # Git configuration
│   ├── nvim/             # Neovim (LazyVim) configuration
│   ├── ghostty/config    # Terminal emulator settings
│   ├── starship.toml     # Shell prompt configuration
│   └── ...
├── dot_zshrc.tmpl        # Main shell configuration
└── install.sh            # Initial installation script
```

### Automation Pattern

**Two-tier Brewfile system** for efficient package management:

1. **`Brewfile`** (auto-installed via `run_onchange_after_*` script):
   - Contains lightweight CLI tools and essential utilities
   - Automatically syncs when file hash changes
   - Fast installation for daily development work
   - Runs automatically on `chezmoi apply` when Brewfile changes

2. **`Brewfile.casks`** (manual installation):
   - Contains large GUI applications (Ghostty, Zed, Snipaste, etc.)
   - Install manually: `brew bundle --file=~/.config/brew/Brewfile.casks`
   - Or use: `chezmoi apply` (runs once via `run_once_*` script with interactive prompt)
   - Separated to reduce bandwidth and speed up automated syncs

The `run_onchange_darwin-install-packages.sh.tmpl` script demonstrates the automation pattern:

1. **Hash-based triggering**: Only runs when `Brewfile` changes (via `{{ include "dot_config/brew/Brewfile" | sha256sum }}`)
2. **Idempotent operations**: Checks for existing installations before acting
3. **Platform-specific**: Uses `{{ if eq .chezmoi.os "darwin" }}` for macOS-only logic

### Python Development Workflow

This dotfiles setup is opinionated toward **uv** (replacing pip/poetry/pyenv):

- `uvs` / `uvr` / `uva` / `uvd` - Sync, run, add, remove dependencies
- `uvdev` / `uvdevh` - Run FastAPI dev server
- `uvtest` / `uvshell` - Run tests or ipython shell

Shell modules in `.chezmoitemplates/zsh/` keep the main `dot_zshrc.tmpl` clean and modular.

### Git Configuration Pattern

Conditional git email based on hostname (`dot_config/git/config.tmpl`):

```go
{{- if eq .chezmoi.hostname "work-laptop" }}
email = "work@example.com"
{{- else }}
email = "personal@example.com"
{{- end }}
```

### Neovim Configuration

Uses **LazyVim** with:
- `lua/config/lazy.lua` - Lazy.nvim bootstrap
- `lua/plugins/init.lua` - Plugin overrides (Catppuccin theme)
- LazyVim plugins are imported; customizations go in `lua/plugins/`

### Key Tooling Decisions

| Category | Tool | Why |
|----------|------|-----|
| Package Manager | Homebrew | macOS standard, declarative via Brewfile |
| Python | uv | Faster than pip/poetry/pyenv, unified toolchain |
| Shell History | Atuin | Sync across machines, better search than ctrl+r |
| Directory Jumping | Zoxide | Smart ranking (frecency) vs cd |
| Git Diff | Delta + difftastic | Side-by-side view + structural diffs |
| Terminal | Ghostty | GPU-accelerated, modern vs iTerm2 |

## Making Changes

1. **Edit files in this repo** (not your home directory) - they're the source of truth
2. **Use `chezmoi edit`** for encrypted files - it handles decryption/encryption automatically
3. **Test with `chezmoi diff`** before applying
4. **Commit to git** to persist changes across machines
5. **Run `chezmoi apply`** on target machines to pull updates

## Adding New Packages

**For lightweight CLI tools:**
- Edit `dot_config/brew/Brewfile` (organized by category)
- The `run_onchange_after_*` script will auto-install on next `chezmoi apply`

**For large GUI applications:**
- Edit `dot_config/brew/Brewfile.casks`
- Install manually: `brew bundle --file=~/.config/brew/Brewfile.casks`
- Or wait for next `chezmoi apply` (interactive prompt via `run_once_*` script)

## Platform-Specific Configuration

Use `{{ if eq .chezmoi.os "darwin" }}` for macOS-only blocks (see `dot_config/git/config.tmpl` for osxkeychain credential helper example).

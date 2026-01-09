# Dotfiles

Modern macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).

Optimized for Python/FastAPI development with modern CLI tools and Neovim workflows.

## Features

- **Modern CLI Stack**: ripgrep, zoxide, eza, bat, fd, fzf, delta, atuin
- **Neovim**: LazyVim with custom keymaps and auto-clipboard sync
- **Python**: uv-based workflow with FastAPI aliases
- **AI**: Claude Code assistant
- **Shell**: Zsh + Oh My Zsh with curated plugins and vi-mode
- **Automation**: One-time macOS defaults and Homebrew package installation
- **Security**: Age encryption for sensitive config

## Quick Start

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply YOUR_GITHUB_USERNAME
```

## What's Included

### Core Tools

| Category | Tools |
|----------|-------|
| **Search** | ripgrep (rg), fd, fzf |
| **Navigation** | zoxide (z), eza (ls/exa) |
| **Viewing** | bat (cat), delta (git diff), difftastic |
| **Git** | lazygit, gh |
| **History** | atuin (sync across machines) |
| **Terminal** | ghostty, starship prompt |

### Development

| Language/Tool | Setup |
|---------------|-------|
| **Python** | `uvs` (sync), `uvr` (run), `uvdev` (FastAPI) |
| **Neovim** | LazyVim + Catppuccin theme |
| **Claude Code** | AI coding assistant |
| **Git** | Aliases: `lg`, `ll`, `amend`, `undo`, `clean-branches` |

### macOS Automation

- **System**: Fast key repeat (1ms), disabled auto-correction
- **Finder**: Full path in title, search current folder by default
- **Dock**: Auto-hide with zero delay, no recent apps
- **Screenshots**: PNG format, no shadow

## Common Commands

```bash
chezmoi init GITHUB_USER     # Initialize from git repo
chezmoi diff                 # Preview changes
chezmoi apply                # Apply changes
chezmoi edit FILE            # Edit managed file (auto decrypts/encrypts)
chezmoi add FILE             # Add file to chezmoi
chezmoi add --encrypt FILE   # Add encrypted file (uses age)
chezmoi update               # Pull latest from git
```

## Structure

```
~/.local/share/chezmoi/
├── .chezmoi.toml.tmpl          # chezmoi config
├── .chezmoiignore              # Files to exclude
├── .chezmoitemplates/          # Reusable templates (zsh modules)
├── dot_zshrc.tmpl              # Shell config
├── dot_zprofile.tmpl           # Login shell config
├── dot_config/
│   ├── nvim/                   # Neovim (LazyVim)
│   ├── git/config.tmpl         # Conditional git email
│   ├── brew/Brewfile           # Homebrew packages
│   ├── starship.toml           # Prompt config
│   ├── ghostty/config          # Terminal
│   ├── lazygit/config.yml      # Git TUI
│   ├── atuin/config.toml       # Shell history
│   └── direnv/                 # Project-specific env
├── run_once_*.sh.tmpl          # One-time setup (tools, packages, defaults, apps)
```

## Customization

**Edit managed files**:
```bash
chezmoi edit ~/.config/git/config
```

**Make changes**: Edit files in `~/.local/share/chezmoi/`, then:
```bash
chezmoi diff   # Preview
chezmoi apply  # Apply
```

**Commit changes**:
```bash
cd ~/.local/share/chezmoi
git add . && git commit -m "message"
```

## References

- [chezmoi documentation](https://www.chezmoi.io/)
- [LazyVim](https://www.lazyvim.org/)
- [dotfiles utilities](https://dotfiles.github.io/utilities/)

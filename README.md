# Dotfiles

Cross-platform dotfiles managed with [chezmoi](https://www.chezmoi.io/).

Optimized for Python/FastAPI and Node.js development with modern CLI tools, Neovim workflows, and AI assistance.

**Supports**: macOS (Apple Silicon + Intel) and Linux (Ubuntu/Debian)

## Features

- **Modern CLI Stack**: ripgrep, zoxide, eza, bat, fd, fzf, delta, atuin, carapace
- **Neovim**: LazyVim with custom keymaps and auto-clipboard sync
- **Python**: uv-based workflow with FastAPI aliases (installed via pipx)
- **Node.js**: nvm + pnpm setup
- **AI**: Claude Code assistant with provider switching
- **Shell**: Zsh + Oh My Zsh with curated plugins and vi-mode
- **Automation**: One-command setup via Homebrew (macOS & Linux)
- **Security**: Age encryption for sensitive config

## Quick Start

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply YOUR_GITHUB_USERNAME
```

## What's Included

### Core Tools

| Category | Tools |
|----------|-------|
| **Search** | ripgrep (rg), fd, fzf, ast-grep |
| **Navigation** | zoxide (z), eza (ls), yazi (file manager) |
| **Viewing** | bat (cat), delta (git diff), difftastic |
| **Git** | lazygit, lazydocker, gh |
| **History** | atuin (sync across machines) |
| **Terminal** | ghostty, tmux, starship prompt |

### Development

| Language/Tool | Setup |
|---------------|-------|
| **Python** | `uvs` (sync), `uvr` (run), `uvdev` (FastAPI) - via pipx |
| **Node.js** | nvm (version management), pnpm (package manager) |
| **Neovim** | LazyVim + Catppuccin theme |
| **Claude Code** | AI coding assistant with provider switcher (ccs) |
| **Docker** | lazydocker (TUI) |
| **Command Runner** | just (command recipes) |

### Data & JSON Tools

| Category | Tools |
|----------|-------|
| **JSON** | jq, jaq (faster), fx (interactive), jless (pager), jnv (filter) |
| **Data** | visidata (spreadsheets), qsv (CSV toolkit) |
| **Logs** | lnav (log navigator), hl (log highlighter) |
| **HTTP/Network** | xh (httpie clone), gping (ping with graph), bore-cli (tunneling) |

### System Tools

| Category | Tools |
|----------|-------|
| **Monitoring** | btop (system monitor) |
| **Compression** | zopfli, pigz (via targz function) |
| **Security** | age (encryption) |
| **Media** | ffmpeg, imagemagick, poppler, resvg |
| **Archives** | sevenzip (7z) |

### Platform Automation

**macOS:**
- **System**: Fast key repeat (1ms), disabled auto-correction
- **Finder**: Full path in title, search current folder by default
- **Dock**: Auto-hide with zero delay, no recent apps
- **Screenshots**: PNG format, no shadow
- **Terminal**: Ghostty with GPU acceleration

**Linux:**
- **Package Manager**: Homebrew for Linux or native package manager
- All CLI tools install automatically via cross-platform scripts
- nvm + Node.js 24 + pnpm auto-installed

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
│   ├── zsh/
│   │   ├── aliases.zsh         # Editor, Claude aliases
│   │   ├── env.zsh             # Environment variables
│   │   ├── functions.zsh       # Shell functions (t, lg, y, ccs, etc.)
│   │   ├── keybindings.zsh     # vi-mode keybindings
│   │   ├── modern-tools.zsh    # eza, bat, atuin, carapace
│   │   ├── node.zsh            # nvm setup
│   │   ├── path.zsh            # PATH configuration
│   │   ├── python.zsh          # uv aliases
│   │   └── vi-mode.zsh         # vi-mode settings
│   └── ...
├── dot_zshrc.tmpl              # Shell config
├── dot_zprofile.tmpl           # Login shell config
├── dot_config/
│   ├── nvim/                   # Neovim (LazyVim)
│   ├── tmux/tmux.conf.tmpl     # tmux config (Ctrl+A prefix)
│   ├── yazi/                   # Yazi file manager
│   ├── git/config.tmpl         # Conditional git email
│   ├── git/ignore              # Global gitignore
│   ├── brew/Brewfile           # Homebrew CLI packages
│   ├── brew/Brewfile.casks     # GUI apps (install separately)
│   ├── starship.toml           # Prompt config
│   ├── ghostty/config.tmpl     # Terminal
│   ├── lazygit/config.yml      # Git TUI
│   ├── atuin/config.toml       # Shell history
│   ├── direnv/direnvrc         # Project-specific env
│   ├── pipx/Pipxfile           # Python global packages
│   └── debian/Aptfile          # Debian packages
├── run_once_*.sh.tmpl          # One-time setup (platform-specific)
├── run_onchange_after_*.tmpl   # Cross-platform scripts (tools, packages, plugins)
└── run_onchange_after_darwin-*.tmpl  # macOS-specific scripts (GUI apps, defaults)
```

## Shell Functions

Quick reference for custom functions:

| Function | Description |
|----------|-------------|
| `t [name]` | Create/attach to tmux session (default: "dev") |
| `lg` | Lazygit (cd to directory on quit) |
| `y [path]` | Yazi file manager (cd on quit) |
| `ccs <provider>` | Switch Claude Code provider |
| `mkd <dir>` | Create directory and enter it |
| `o [file]` | Open file/directory (cross-platform) |
| `server [port]` | Start HTTP server (default: 8000) |

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
- [uv documentation](https://docs.astral.sh/uv/)

# Dotfiles

Modern dotfiles for macOS development, managed with [chezmoi](https://www.chezmoi.io/).

Optimized for Python/FastAPI development, modern CLI tools, and Vim workflows.

## Features

- Modern CLI tools: ripgrep, zoxide, eza, bat, fd, fzf
- Git with smart aliases and conditional config
- Zsh with Oh My Zsh and curated plugins
- Starship prompt with vim mode indicator
- Python development with uv
- Opinionated macOS defaults
- Age encryption for secrets

## Quick Start

```bash
# Install chezmoi and apply dotfiles
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/YOUR_USERNAME/dotfiles.git
```

Or use the install script:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/.local/share/chezmoi
cd ~/.local/share/chezmoi
./install.sh
```

## What's Included

### CLI Tools

| Tool | Description | Replaces |
|------|-------------|----------|
| ripgrep | Fast code search | grep |
| zoxide | Smart directory jumper | cd |
| eza | Modern ls with git status | ls |
| bat | Syntax-highlighted cat | cat |
| fd | Fast file finder | find |
| fzf | Fuzzy finder | - |
| starship | Fast minimal prompt | - |
| lazygit | Git TUI | - |

### Zsh Configuration

**Oh My Zsh** with plugins:
- git, vi-mode, uv, zoxide, fzf
- zsh-completions, zsh-autosuggestions, fzf-tab, zsh-syntax-highlighting

**Features**:
- Vi-mode with Emacs key bindings (Ctrl+A/E/K/U/W)
- Fast key repeat (2ms) for Vim
- 50k line history with deduplication
- Word navigation with Ctrl/Alt+Arrow

### Git Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `lg` | Pretty graph log | Colorful commit history |
| `ll` | Detailed log | Log with file changes |
| `amend` | Commit --amend --no-edit | Quick fix last commit |
| `undo` | Reset --soft HEAD~1 | Undo last commit |
| `clean-branches` | Delete merged | Cleanup merged branches |
| `pf` | Push --force-with-lease | Safe force push |

**Global ignore**: .DS_Store, IDE files, .env.local, *.key, *.pem

### Python Development

**uv workflow** aliases:

```bash
uvs      → uv sync                # Install dependencies
uvr      → uv run                 # Run in project env
uva/uvd  → uv add/remove          # Manage dependencies
uvinit   → uv init                # New project

# FastAPI
uvdev    → uvicorn main:app --reload
uvdevh   → uvicorn --reload --host 0.0.0.0

# Testing
uvtest   → pytest
uvshell  → ipython
```

### macOS Defaults

- Fast key repeat (2ms) for Vim
- Finder: show full path, search current folder
- Dock: auto-hide with zero delay
- Screenshots: PNG format
- Disable auto-correction/capitalization

## Secrets Management

Encrypt sensitive config with age:

```bash
# Generate key
age-keygen -o ~/.config/age/key.txt

# Encrypt secrets
cat > secrets.sh << 'EOF'
export API_KEY="secret"
EOF
age -r YOUR_PUBLIC_KEY -o encrypted_secrets.sh.age secrets.sh
rm secrets.sh

# Edit encrypted file
chezmoi edit ~/.config/secrets.sh
```

## Customization

### Change Git Email

Edit `.config/git/config.tmpl`:

```toml
{{- if eq .chezmoi.hostname "work-laptop" }}
email = "work@example.com"
{{- else }}
email = "personal@example.com"
{{- end }}
```

### Add Packages

Edit `.config/brew/Brewfile`:

```ruby
brew "package-name"
cask "app-name"
```

Then: `chezmoi apply`

### Custom Aliases

Add to `.zshrc.tmpl` or create `.chezmoitemplates/zsh/custom.zsh`

## Common Commands

```bash
chezmoi diff      # Preview changes
chezmoi apply     # Apply all changes
chezmoi edit FILE # Edit managed file
chezmoi add FILE  # Add new file

# Update from git
chezmoi update

# Making changes
cd ~/.local/share/chezmoi
git add .
git commit -m "message"
git push
```

## Troubleshooting

**Plugins not loading**: 
```bash
~/.local/share/chezmoi/run_onchange_darwin-install-packages.sh
```

**macOS defaults not applying**: Log out and log back in

**Key repeat slow**: 
```bash
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
```
Then log out/in.

## License

MIT

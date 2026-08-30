# CLAUDE.md

Guidance for Claude Code working in this repository.

## Overview

chezmoi-managed dotfiles for macOS development, opinionated toward Python/FastAPI and
modern CLI tools. `.tmpl` files use Go template syntax.

## Common Commands

```bash
chezmoi apply                # deploy source state to $HOME
chezmoi diff                 # preview changes before applying
chezmoi edit ~/.env          # edit encrypted file (age; source: encrypted_dot_env.age)
chezmoi add ~/.path/to/file  # bring a new file under management
chezmoi update               # pull remote changes and apply
```

## Architecture

### Structure & Templates

- `dot_*.tmpl` → dotfiles in `$HOME` (`dot_zshrc.tmpl` → `~/.zshrc`); `dot_config/**` → `~/.config/`
- `run_onchange_*` scripts re-run when a watched file hash changes; `run_once_*` run once; all live in `.chezmoiscripts/`
- `.chezmoitemplates/zsh/` holds 10 shell modules, included by `dot_zshrc.tmpl` via `{{ template "zsh/<name>" . }}`
- Template variables: `.chezmoi.hostname`, `.chezmoi.os` (darwin/linux), `.chezmoi.sourceDir`

```text
├── .chezmoiscripts/          # run_once_before_* (4), run_onchange_after_* (9), run_after_* (2)
├── .chezmoitemplates/zsh/    # 10 zsh modules (python.zsh, modern-tools.zsh, ...)
├── dot_config/
│   ├── brew/
│   │   ├── Brewfile          # CLI tools (auto-synced)
│   │   └── Brewfile.casks    # GUI apps (interactive/manual)
│   ├── git/                  # config.tmpl
│   ├── ghostty/
│   ├── starship.toml
│   └── ...
├── dot_zshrc.tmpl
├── encrypted_dot_env.age     # → ~/.env
└── install.sh
```

### Automation & Packages

Two-tier Brewfile system:

1. **`Brewfile`** — lightweight CLI tools. Auto-synced by
   `.chezmoiscripts/run_onchange_after_02-darwin-install-packages.sh.tmpl`, triggered by
   `{{ include "dot_config/brew/Brewfile" | sha256sum }}`. To add a CLI tool, edit
   `dot_config/brew/Brewfile`; it installs on the next `chezmoi apply`.
2. **`Brewfile.casks`** — large GUI apps. Installed by
   `.chezmoiscripts/run_onchange_after_80-darwin-install-casks.sh.tmpl` (hash-triggered,
   interactive `Continue? [y/N]` prompt; declining skips). Manual:
   `brew bundle --file=~/.config/brew/Brewfile.casks`.

### Python (uv)

uv replaces pip/poetry/pyenv — use uv, not pip. Aliases in
`.chezmoitemplates/zsh/python.zsh`: `uvs`/`uvr`/`uva`/`uvd` (sync/run/add/remove),
`uvdev`/`uvdevh` (FastAPI dev server), `uvtest`/`uvshell`.

### Git

`dot_config/git/config.tmpl` renders user/email from `{{ .name }}`/`{{ .email }}`
(`promptStringOnce` data in `.chezmoi.toml.tmpl`; email defaults to
`daniel123.xiang@gmail.com`). Only conditional: credential helper —
darwin → `osxkeychain`, linux → `store`.

### Key Tooling Decisions

| Category | Tool | Why |
| :--- | :--- | :--- |
| Package Manager | Homebrew | declarative Brewfile |
| Python | uv | faster, unified |
| Directory Jumping | Zoxide | frecency ranking |
| Git Diff | Delta + difftastic | side-by-side + structural |
| Terminal | Ghostty | GPU-accelerated |
| AI Models | GLM-5.3 | complex-task quality |

### Claude Code Models & Env

Models (in `dot_ccs_env`): `glm-5.3[1m]` (Opus/Sonnet), `glm-5.3-flash[1m]` (Haiku).
Env (in `dot_claude/settings.json`): `CLAUDE_CODE_AUTO_COMPACT_WINDOW="1000000"`,
`CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1`, `API_TIMEOUT_MS="3000000"`.

## Making Changes

1. Edit files in this repo (source of truth), not `$HOME`
2. Use `chezmoi edit` for encrypted files
3. Test with `chezmoi diff` before applying
4. Commit to git to persist across machines
5. `chezmoi apply` on target machines to pull updates

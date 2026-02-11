# Quick Start

Essential tools and their daily usage.

## Table of Contents

- [Navigation & Search](#navigation--search)
- [Shell History](#shell-history)
- [Git & GitHub](#git--github)
- [Python Development](#python-development)
- [Editor & Terminal](#editor--terminal)

---

## Navigation & Search

### zoxide (Smart `cd`)

```bash
z <pattern>    # Jump to directory with fuzzy matching
z <folder>     # Jump to recently used folder
z               # List frequent directories

# Examples
z dot          # Jump to dotfiles
z proj         # Jump to project folder
```

### eza (Modern `ls`)

```bash
eza             # List files
eza -l          # Long format
eza -la         # All files, long format
eza -T          # Tree view
eza -la --git  # Show git status

# Aliases
ls → eza
ll → eza -l
```

### ripgrep (Fast `grep`)

```bash
rg <pattern>              # Search in current dir
rg <pattern> <path>       # Search in path
rg -i <pattern>           # Case insensitive
rg -t py <pattern>        # Search in Python files
rg --glob '!*.pyc' <pat>  # Exclude files

# Examples
rg "TODO"                 # Find TODOs
rg "def main"             # Find main function
rg -l "import"            # Only show filenames
```

### fd (Fast `find`)

```bash
fd <pattern>              # Find files/dirs
fd -t f <pattern>         # Files only
fd -t d <pattern>         # Dirs only
fd -e py <pattern>        # By extension

# Examples
fd main                   # Find main files
fd -t d test              # Find test dirs
```

### fzf (Fuzzy Finder)

```bash
# Ctrl+T - Insert file path
# Ctrl+R - Search command history
# Alt+C - Fuzzy change directory

# Pipe to fzf
rg "pattern" | fzf
fd . | fzf
```

---

## Shell History

### atuin (Synced Shell History)

```bash
# Setup (first time only)
atuin register -u <username> -e <email>    # Register account
atuin login                                 # Login to sync
atuin key                                   # View encryption key (save to password manager!)

# Import & Sync
atuin import auto                           # Import existing shell history
atuin sync                                  # Manual sync (auto-sync enabled by default)

# Security
atuin account delete                        # Delete server data
atuin history prune --dry-run               # Preview deletions
atuin history prune                         # Delete matching entries

# Daily usage
# Up arrow - Search history (fuzzy)
# Ctrl+R - Full interactive search
```

---

## Git & GitHub

### lazygit (Git TUI)

```bash
lg              # Open lazygit

# Keybindings
x       - Stage/unstage file
c       - Commit
p       - Push
f       - Fetch
?       - Help
```

### Git Aliases

```bash
lg              # LazyGit
ll              # Detailed log
amend           # Amend last commit
undo            # Undo last commit
pf              # Force push (safe)
```

### gh (GitHub CLI)

```bash
gh pr list              # List PRs
gh pr checkout 123      # Checkout PR
gh issue create         # Create issue
gh repo view            # Show repo info
```

---

## Python Development

### uv (Python Package Manager)

```bash
# Project setup
uv init                 # Init project
uv venv                 # Create venv
uv sync                 # Install dependencies

# Daily workflow (aliases)
uvs                     # uv sync
uvr <cmd>               # uv run
uva <pkg>               # uv add
uvd <pkg>               # uv remove

# FastAPI development
uvdev                   # uvicorn main:app --reload
uvdevh                  # uvicorn --reload --host 0.0.0.0

# Testing
uvtest                  # pytest
uvshell                 # ipython
```

### direnv (Per-directory Environment)

```bash
# Create .envrc in project root
echo 'layout_uv' > .envrc

# Usage
direnv allow            # Allow .envrc (first time or after changes)
direnv reload           # Reload .envrc manually
direnv edit             # Edit .envrc in $EDITOR

# Common layouts
layout_uv               # Auto-activate uv venv (Python)
layout_node             # Auto-detect Node version
use python              # Use system Python
use node                # Use system Node

# Troubleshooting
direnv status           # Show status and loaded env
direnv allow .          # Allow current directory
```

**Example .envrc files**:

```bash
# Python project with uv
layout_uv

# Or specify Python version
layout_python python3.12

# Node.js / React project
layout_node

# Custom environment variables
export DATABASE_URL="postgresql://localhost/mydb"
export DEBUG=true
```

---

## Editor & Terminal

### Neovim (LazyVim)

```vim
# System clipboard
Cmd+C / Cmd+V           # Copy/Paste (normal/insert mode)

# Quick actions
<space> + e             # File explorer
<space> + f             # Find files
<space> + b             # Buffers
<space> + gd            # Go to definition
:spell                  # Toggle spell check
```

### ghostty (Terminal Emulator)

```bash
# New tab: Cmd+T
# Split: Cmd+D (horizontal), Cmd+Shift+D (vertical)
# Navigate splits: Cmd+[ | Cmd+]
# Close tab: Cmd+W
```

### tmux (Terminal Multiplexer)

```bash
tmux                    # Start session

# Prefix key: Ctrl+A (customized from default Ctrl+B)
# Keybindings (press Ctrl+A then:)
Ctrl+A c                # New window
Ctrl+A n / Ctrl+A p     # Next/previous window
Ctrl+A 0-9              # Switch to window by number
Ctrl+A ,                # Rename window
Ctrl+A w                # List windows
Ctrl+A %                # Split pane vertically
Ctrl+A "                # Split pane horizontally
Ctrl+A arrow keys       # Navigate panes
Ctrl+A x                # Close pane
Ctrl+A d                # Detach session
tmux ls                 # List sessions
tmux attach             # Reattach to session
```

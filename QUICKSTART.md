English | [简体中文](QUICKSTART.zh-CN.md)

# Quick Start

Essential tools and their daily usage.

## Table of Contents

- [Navigation & Search](#navigation-search)
- [Text Processing](#text-processing)
- [Shell Functions](#shell-functions)
- [Git & GitHub](#git-github)
- [SSH & Sessions](#ssh-sessions)
- [Python Development](#python-development)
- [Process Management](#process-management)
- [Node.js Development](#nodejs-development)
- [Data & JSON Tools](#data-json-tools)
- [Log Analysis](#log-analysis)
- [HTTP & Network](#http-network)
- [Editor & Terminal](#editor-terminal)
- [Kaggle CLI](#kaggle-cli)

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
ls → eza --icons --git
ll → eza -l --header --time-style long-iso
la → eza -la --header --time-style long-iso
tree → eza --tree --icons
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

### sd (Modern Find & Replace)

```bash
sd 'old' 'new' file.txt           # Simple replace
sd 'foo.*bar' 'baz' file.txt      # Regex replace
sd -s 'old' 'new' file.txt        # String literal replace
sd 'old' 'new' -i file.txt        # Case insensitive
sd 'old' 'new' *.txt              # Multiple files

# Pipeline usage
cat file.txt | sd 'foo' 'bar'
rg "pattern" -l | sd "\.txt$" ".md"  # Rename files via list
```

Faster and more intuitive than sed, with regex-first syntax.

---

## Shell Functions

### File System

```bash
mkd <dir>         # Create directory and enter it
o [file]          # Open file/directory (cross-platform)
cdf               # cd to Finder window location (macOS)
```

### Development Tools

```bash
server [port]     # Start HTTP server (default: 8000)
dataurl <file>    # Create data URL from file
digga <domain>    # DNS lookup (useful output)
getcertnames <domain>  # Show SSL certificate names
```

### Compression

```bash
targz <dir>       # Create .tar.gz archive
gz <file>         # Compare original vs gzipped size
```

### Terminal Apps

```bash
lg                # Lazygit (cd to directory on quit)
y [path]          # Yazi file manager (cd on quit)
s                 # lazyssh (SSH server picker)
d                 # dmux (tmux session manager)
t [name]          # Tmux session (default: "dev")
ccs <provider>    # Switch Claude Code provider
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

### Git Aliases (Oh My Zsh)

```bash
gst             # git status
gd              # git diff
gco <branch>    # git checkout
gcb <branch>    # git checkout -b
gc              # git commit
gp              # git push
gl              # git log
```

### gh (GitHub CLI)

```bash
gh pr list              # List PRs
gh pr checkout 123      # Checkout PR
gh issue create         # Create issue
gh repo view            # Show repo info
```

---

## SSH & Sessions

### lazyssh (SSH Server Picker)

```bash
s                       # Quick open SSH picker (alias)
lazyssh                 # Full command
```

Interactive TUI for quickly connecting to saved SSH servers. Press `?` for help, `q` to quit.

### dmux (Tmux Session Manager)

```bash
d                       # Quick open dmux (alias)
dmux                    # Full command
```

Tmux session manager for organizing terminal workspaces. Automatically creates `.dmux/` directory for session state.

---

## Python Development

### uv (Python Package Manager)

**Installation**: `pipx install uv`

```bash
# Project setup
uvinit                  # Init project (alias)
uv venv                 # Create venv
uvs                     # uv sync (install dependencies)

# Daily workflow
uvr <cmd>               # uv run
uva <pkg>               # uv add
uvd <pkg>               # uv remove
uvlock                  # uv lock
uvpython                # uv python

# FastAPI development
uvdev                   # uvicorn main:app --reload
uvdevh                  # uvicorn --reload --host 0.0.0.0

# Testing
uvtest                  # pytest
uvtestv                 # pytest -v
uvshell                 # ipython

# Traditional venv (fallback)
venv                    # python3 -m venv .venv
act                     # source .venv/bin/activate
deact                   # deactivate
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

## Process Management

### procs (Modern ps)

```bash
procs                   # Colorized process list
procs python            # Filter by name
procs --tree            # Tree view
procs --sort cpu        # Sort by CPU usage
procs --watch           # Auto-refresh (like htop)
```

Modern replacement for ps with colors, auto-formatting, and intelligent column sizing.

---

## Node.js Development

### nvm (Node Version Manager)

```bash
# Install Node.js
nvm install 24          # Install Node.js 24
nvm alias default 24    # Set as default

# Daily usage
nvm use 24              # Switch to Node.js 24
node --version          # Check version
```

### pnpm (Package Manager)

```bash
pnpm install            # Install dependencies
pnpm add <pkg>          # Add package
pnpm dev                # Run dev script
pnpm build              # Build project
```

---

## Data & JSON Tools

### jq / jaq (JSON Processor)

```bash
jq '.'                  # Pretty print JSON
jq '.key'               # Extract key
jq 'map(.key)'          # Transform array
jq -c                   # Compact output (save tokens)

# jaq is faster (Rust implementation)
jaq '.' file.json
```

### fx (Interactive JSON Viewer)

```bash
fx file.json            # Interactive JSON viewer
# Press: / to search, q to quit
```

### jless (JSON Pager)

```bash
jless file.json         # View JSON with vim keybindings
# hjkl - navigate, q - quit
```

### jnv (Interactive JSON Filter)

```bash
jnv file.json           # Interactive JSON filtering
# Type filter live, see results instantly
```

### visidata (Terminal Spreadsheet)

```bash
vd file.csv             # Open CSV/TSV as spreadsheet
# Keys: < to sort, / to search, q to quit
```

### qsv (Fast CSV Toolkit)

```bash
qsv count data.csv      # Count rows
qsv select col1,col2    # Select columns
qsv search pattern      # Search CSV
qsv stats               # Column statistics
```

---

## Log Analysis

### lnav (Log File Navigator)

```bash
lnav /var/log/*.log     # View logs with syntax highlighting
# Keys: / to search, :help for commands
```

### hl (Log Highlighter)

```bash
hl -c error log.txt     # Highlight errors in color
hl -p "ERROR|WARN" log  # Custom pattern
```

---

## HTTP & Network

### xh (HTTP Client)

```bash
xh https://api.example.com    # GET request
xh POST https://api.example.com name=John  # POST
xh -f https://api.example.com  # Follow redirects
```

### gping (Ping with Graph)

```bash
gping google.com       # Ping with live graph
gping 8.8.8.8 1.1.1.1  # Multiple hosts
```

### bore-cli (Tunneling)

```bash
bore local 8000        # Tunnel localhost:8000 to public URL
```

---

## Editor & Terminal

### yazi (File Manager)

```bash
y [path]               # Open yazi (cd to directory on quit)
# Keybindings:
# q - Quit and cd to selected directory
# hjkl - Navigate
# / - Search
# Enter - Open
```

### Neovim (LazyVim)

**Enabled Extras**: codeium (AI), mini-surround, docker, json, markdown, python, toml, yaml

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
Ctrl+A c                # New window (in current dir)
Ctrl+A n / Ctrl+A p     # Next/previous window
Ctrl+A 0-9              # Switch to window by number
Ctrl+A ,                # Rename/lock window
Ctrl+A w                # List windows
Ctrl+A |                # Split pane vertically
Ctrl+A -                # Split pane horizontally
Ctrl+A arrow keys       # Navigate panes
Ctrl+A x                # Close pane
Ctrl+A d                # Detach session
Ctrl+A r                # Reload config

# Session management
t [name]                # Quick attach/create (function)
tmux ls                 # List sessions
tmux attach             # Reattach to session
```

### System Monitoring

```bash
btop                    # Modern system monitor (htop replacement)
# Keys: q to quit, / for filter, F4 for process filter
```

### Command Running

```bash
just                    # List available commands
just run                # Run command
just -l                 # List all recipes
```

---

## Kaggle CLI

```bash
kaggle competitions list           # List competitions
kaggle competitions download -c <name>  # Download competition data
kaggle datasets download -d <name> # Download dataset
kaggle kernels output <username>   # View kernel output
kaggle kernels list                # List kernels
kaggle files list <competition>    # List files in competition
```

Kaggle CLI for data science competitions and datasets (installed via pipx).

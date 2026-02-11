# =============================================================================
# Environment Variables
# =============================================================================

# -----------------------------------------------------------------------------
# XDG Base Directory Specification
# -----------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------
# Initialize Homebrew environment (sets HOMEBREW_PREFIX, PATH, MANPATH, etc.)
# macOS Apple Silicon
if [[ -d "/opt/homebrew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
# Linux / macOS Intel
elif [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -d "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

export HOMEBREW_NO_AUTO_UPDATE=1      # Disable auto-update (update manually with `brew update`)
export HOMEBREW_NO_ENV_HINTS=1        # Hide environment hints

# -----------------------------------------------------------------------------
# Core Environment
# -----------------------------------------------------------------------------
export LANG=en_US.UTF-8
export EDITOR="nvim"
export VISUAL="$EDITOR"

# -----------------------------------------------------------------------------
# Tools
# -----------------------------------------------------------------------------
# Carapace completion engine
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'

# -----------------------------------------------------------------------------
# Local Environment Variables
# -----------------------------------------------------------------------------
# Claude Code Provider Selector
# Options: zhipu | packy | default
# default: Use official Anthropic API (no custom BASE_URL)
export CLAUDE_PROVIDER="packy"
[[ -f "$HOME/.env" ]] && source "$HOME/.env"

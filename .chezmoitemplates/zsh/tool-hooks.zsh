# =============================================================================
# Tool Hooks Initialization
# =============================================================================
# These tools require eval hooks and must be loaded after compinit
# to ensure their completions are properly registered
# =============================================================================

# Zoxide (smart directory jumper)
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# Direnv (per-directory environment variables)
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# FZF (fuzzy finder) configuration
if command -v fzf >/dev/null 2>&1; then
    # Use fd instead of find for better performance
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

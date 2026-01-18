# =============================================================================
# Aliases
# =============================================================================

# -----------------------------------------------------------------------------
# Editor
# -----------------------------------------------------------------------------
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# -----------------------------------------------------------------------------
# Zellij - Terminal Multiplexer
# -----------------------------------------------------------------------------
# Smart attach: attach to last session or create new one
alias zj='zellij attach --index 0 --create'
# List sessions
alias zjl='zellij list-sessions'
# Kill all sessions
alias zjk='zellij kill-all-sessions'
# Launch with Claude Code layout (5 tabs with claude command)
alias zjcc='zellij --layout ~/.config/zellij/layouts/cc.kdl --session claude'

# -----------------------------------------------------------------------------
# Utils
# -----------------------------------------------------------------------------
alias c="clear"
alias h="history"

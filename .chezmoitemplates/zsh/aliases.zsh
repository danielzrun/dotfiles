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
# Launch with Claude Code layout: attach to "cc" session or create new
alias zcc='zellij attach cc --create --layout ~/.config/zellij/layouts/cc.kdl'

# -----------------------------------------------------------------------------
# Utils
# -----------------------------------------------------------------------------
alias c="claude"
alias cc="claude"

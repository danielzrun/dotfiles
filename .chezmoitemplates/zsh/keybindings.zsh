# ====================================================================
# Zsh Key Bindings - Optimized for vi-mode with Emacs conveniences
# ====================================================================

# Keep useful Emacs-style bindings in vi-mode
bindkey '^A' beginning-of-line       # Ctrl+A - Jump to line start
bindkey '^E' end-of-line             # Ctrl+E - Jump to line end
bindkey '^K' kill-line               # Ctrl+K - Delete to end of line
bindkey '^U' backward-kill-line      # Ctrl+U - Delete to start of line
bindkey '^W' backward-kill-word      # Ctrl+W - Delete previous word

# Word navigation with Ctrl + Arrow keys
bindkey '^[[1;5C' forward-word       # Ctrl + Right Arrow
bindkey '^[[1;5D' backward-word      # Ctrl + Left Arrow

# Alternative bindings for different terminals
bindkey '^[^[[C' forward-word        # Alt + Right Arrow
bindkey '^[^[[D' backward-word       # Alt + Left Arrow

# Option + Arrow keys (macOS Terminal/Ghostty)
bindkey '^[f' forward-word           # Option + Right Arrow
bindkey '^[b' backward-word          # Option + Left Arrow

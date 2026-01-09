# =============================================================================
# Modern Unix Tools Integration
# =============================================================================

# Starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# Eza (modern ls replacement)
if command -v eza >/dev/null 2>&1; then
    alias ls="eza --icons --git"
    alias ll="eza --icons --git -l --header --time-style long-iso"
    alias la="eza --icons --git -la --header --time-style long-iso"
    alias tree="eza --tree --icons"
fi

# Bat (syntax-highlighted cat)
if command -v bat >/dev/null 2>&1; then
    alias cat="bat -p"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Carapace (advanced completion)
if command -v carapace >/dev/null 2>&1; then
    source <(carapace _carapace zsh)
fi

# Atuin (shell history search & sync)
if command -v atuin >/dev/null 2>&1; then
    eval "$(atuin init zsh)"
fi

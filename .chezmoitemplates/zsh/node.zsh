# =============================================================================
# Node.js Package Managers & Version Control
# =============================================================================

# nvm (Node Version Manager)
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
    # Load bash completion for nvm commands
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
fi

# pnpm global bin directory
export PNPM_HOME="${PNPM_HOME:-$HOME/.local/share/pnpm}"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Bun completions (if installed)
[ -f "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

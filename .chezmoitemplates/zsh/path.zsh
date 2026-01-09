# =============================================================================
# PATH Configuration
# =============================================================================
# Add to PATH in order of priority

# Local binaries (highest priority)
export PATH="$HOME/.local/bin:$PATH"

# Bun
if command -v bun >/dev/null 2>&1; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# =============================================================================
# PATH Configuration
# =============================================================================
# Add to PATH in order of priority

# Local binaries (highest priority)
export PATH="$HOME/.local/bin:$PATH"

# Bun (only add if installed)
if [ -d "$HOME/.bun" ]; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

#!/bin/sh
# =============================================================================
# Chezmoi Installation Script
# =============================================================================

# Install chezmoi if not already present
if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)"
fi

# Initialize and apply (non-interactive mode)
bin/chezmoi init --apply --source=.

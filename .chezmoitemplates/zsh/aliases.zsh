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
# Utils
# -----------------------------------------------------------------------------
alias cc="claude"
alias c="cc"
alias cb="claude --dangerously-skip-permissions"
alias d="dmux"
alias s="lazyssh"

{{ if eq .chezmoi.os "linux" -}}
# Linux-specific: fd-find installs as fdfind
alias fd="fdfind"
alias bat="batcat"
{{- end }}

# -----------------------------------------------------------------------------
# Git (essential aliases only)
# -----------------------------------------------------------------------------
alias g="git"
alias gst="git status"
alias gaa="git add --all"
alias gcmsg="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias glog="git log --oneline --graph --decorate"

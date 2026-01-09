# =============================================================================
# Utility Functions
# =============================================================================

# Create directory and cd into it
mkcd() {
    mkdir -p "$@" && cd "${@: -1}"
}

# Kill process by port
killport() {
    lsof -ti:$1 | xargs kill -9 2>/dev/null || echo "No process found on port $1"
}

# Show public IP address
myip() {
    curl -s ipinfo.io/ip
}

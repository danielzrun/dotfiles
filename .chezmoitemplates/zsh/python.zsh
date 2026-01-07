# =============================================================================
# Python Development (uv + FastAPI)
# =============================================================================

# Python
alias py="python3"

# uv project management
alias uvs="uv sync"
alias uvr="uv run"
alias uva="uv add"
alias uvd="uv remove"
alias uvinit="uv init"
alias uvlock="uv lock"
alias uvpython="uv python"

# FastAPI development
alias uvdev="uv run uvicorn main:app --reload"
alias uvdevh="uv run uvicorn main:app --reload --host 0.0.0.0"
alias uvtest="uv run pytest"
alias uvtestv="uv run pytest -v"
alias uvshell="uv run ipython"

# Traditional venv (fallback)
alias venv="python3 -m venv .venv"
alias act="source .venv/bin/activate"
alias deact="deactivate"

# ====================================================================
# Vi-mode Configuration - Cursor shape changes for Zellij/Ghostty
# ====================================================================

# Reduce ESC delay for vi-mode (default 0.4s is too slow)
export KEYTIMEOUT=1

# Enable vi-mode cursor shape changes
VI_MODE_SET_CURSOR=true

# Cursor shape for different vi modes
# - Normal mode: block cursor (\e[2 q)
# - Insert mode: beam cursor (\e[6 q)
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    # Normal mode: block cursor
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    # Insert mode: beam cursor
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

# Set beam cursor on startup
function zle-line-init {
  echo -ne '\e[6 q'
}
zle -N zle-line-init

# Reset cursor to beam on each prompt (prevents block cursor from persisting)
function reset_cursor {
  echo -ne '\e[6 q'
}
precmd_functions+=(reset_cursor)

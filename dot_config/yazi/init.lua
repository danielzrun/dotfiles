-- Yazi Init Configuration
-- Documentation: https://yazi-rs.github.io/docs/configuration/overview

-- Relative Motions Plugin Configuration
-- Enables Vim-style relative line number jumping
require("relative-motions"):setup({
    -- Show relative numbers with absolute on current line (like Vim's relativenumber)
    show_numbers = "relative_absolute",

    -- Display input numbers in status bar to avoid blind typing errors
    show_motion = true,
})

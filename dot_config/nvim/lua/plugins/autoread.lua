return {
    {
        "djoshea/vim-autoread",
        lazy = false,
        -- This plugin is written in Vimscript and typically doesn't require additional setup
        -- It automatically enhances Neovim's autoread behavior
        event = { "BufReadPost", "BufWritePost" }, -- Enable after reading or writing files
    },
}

-- Terminal configuration
return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            -- <C-/> is recommended, equivalent to <C-_> in many terminals
            open_mapping = [[<C-/>]],
            direction = "horizontal",
            hide_numbers = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            close_on_exit = true,
        },
    },
}

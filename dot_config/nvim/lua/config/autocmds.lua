-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Auto-sync yanked text to system clipboard
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        -- Only copy to system clipboard when the operation is "yank" (y)
        -- Exclude delete (d), change (c), and other operations
        if vim.v.event.operator == "y" then
            vim.fn.setreg("+", vim.fn.getreg("0"))
        end
    end,
})

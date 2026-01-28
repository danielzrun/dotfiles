-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable spell checking for markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },

    callback = function()
        vim.schedule(function()
            vim.opt_local.spell = false
        end)
    end,
})

-- Auto-read file changes from disk
-- Core logic: Execute checktime when cursor stops (CursorHold) or window gains focus (FocusGained)
local autoread_group = vim.api.nvim_create_augroup("AutoReadWatcher", { clear = true })

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "FocusGained", "BufEnter" }, {
    group = autoread_group,
    callback = function()
        -- Skip checktime in diff mode to avoid interfering with window initialization
        if vim.wo.diff then return end

        -- Only check when not in command-line window
        if vim.fn.getcmdwintype() == "" then
            -- checktime is a built-in vim command to check if file has changed on disk
            vim.cmd("checktime")
        end
    end,
})

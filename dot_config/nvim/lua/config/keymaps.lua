-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy to system clipboard in visual mode using Cmd+C
vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "yy", '"+yy', { desc = "Yank line to system clipboard" })
vim.keymap.set("v", "y", '"+y', { desc = "Yank to system clipboard" })


-- Paste from system clipboard using Cmd+V in normal and visual mode
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p', { desc = "Paste from system clipboard" })
-- Paste from system clipboard using Cmd+V in insert mode
vim.keymap.set("i", "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- Scroll viewport without moving cursor (scroll wheel behavior)
vim.keymap.set({ "n", "v" }, "<ScrollWheelUp>", "<C-y>", { silent = true, desc = "Scroll viewport up" })
vim.keymap.set({ "n", "v" }, "<ScrollWheelDown>", "<C-e>", { silent = true, desc = "Scroll viewport down" })

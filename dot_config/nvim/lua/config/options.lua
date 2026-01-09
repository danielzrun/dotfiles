-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable spell checking by default (use :set spell to enable)
vim.opt.spell = false
-- Configure spell checking languages for English and CJK (when enabled)
vim.opt.spelllang = { "en", "cjk" }

-- Disable clipboard integration to prevent conflicts with system clipboard keymaps
vim.opt.clipboard = ""

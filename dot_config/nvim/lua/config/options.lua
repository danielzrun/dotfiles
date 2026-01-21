-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable spell checking by default (use :set spell to enable)
vim.opt.spell = false
-- Configure spell checking languages for English and CJK (when enabled)
vim.opt.spelllang = { "en", "cjk" }

-- Set root directory priority (cwd first, then lsp, then .git)
vim.g.root_spec = { "cwd", "lsp", ".git" }

-- Disable clipboard integration (use "+ register explicitly for system clipboard)
vim.opt.clipboard = ""

-- Enable mouse support
vim.opt.mouse = "a"

-- Keep 8 lines visible when scrolling
vim.opt.scrolloff = 8

-- Automatically read file changed outside of Vim
vim.opt.autoread = true

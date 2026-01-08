-- Configure Catppuccin theme
return {
  -- LazyVim already includes catppuccin, just configure it
  {
    "catppuccin",
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- make sure to load this before all other start plugins
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

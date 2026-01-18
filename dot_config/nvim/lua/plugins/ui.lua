-- UI Configuration: Theme and UI enhancements
return {
    -- Theme / Colorscheme
    {
        "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "mocha",
            transparent_background = false,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- Better escape from insert mode
    {
        "max397574/better-escape.nvim",
        opts = {
            timeout = 200,
            -- New version requires mappings per mode
            mappings = {
                i = {
                    j = {
                        k = "<Esc>",
                        j = "<Esc>",
                    },
                },
                c = {
                    j = {
                        k = "<Esc>",
                    },
                },
                t = {
                    j = {
                        k = "<C-\\><C-n>", -- Fix terminal mode vim operations
                    },
                },
                v = {
                    j = {
                        k = "<Esc>",
                    },
                },
            },
        },
    },

    -- Status line with Python venv indicator
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            local function venv_component()
                local venv = require("venv-selector").get_active_venv()
                if venv and venv ~= "" then
                    return " " .. venv:match("([^/]+)$") -- Extract env name from path
                end
                return ""
            end

            table.insert(opts.sections.lualine_x, {
                --venv_component,
                "python",
                color = { fg = "#f9e2af" }, -- Catppuccin yellow
            })
        end,
    },
}

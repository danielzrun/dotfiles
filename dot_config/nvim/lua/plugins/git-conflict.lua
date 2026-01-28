return {
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            default_commands = true,
            default_mappings = true,
            disable_diagnostics = false,
            list_opener = "copen",
            highlights = {
                incoming = "DiffAdd",
                current = "DiffChange",
            },
        },
        config = function(_, opts)
            require("git-conflict").setup(opts)

            local wk_status, wk = pcall(require, "which-key")
            if wk_status then
                wk.add({
                    { "<leader>gc", group = "Git Conflicts" },
                })
            end
        end,
        keys = {
            { "<leader>gcl", "<cmd>GitConflictListQf<cr>",       desc = "List Conflicts" },
            { "<leader>gco", "<cmd>GitConflictChooseOurs<cr>",   desc = "Choose Ours" },
            { "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose Theirs" },
            { "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>",   desc = "Choose Both" },
            { "<leader>gc0", "<cmd>GitConflictChooseNone<cr>",   desc = "Choose None" },
            { "<leader>gcn", "<cmd>GitConflictNextConflict<cr>", desc = "Next Conflict" },
            { "<leader>gcp", "<cmd>GitConflictPrevConflict<cr>", desc = "Prev Conflict" },
        },
    },
}

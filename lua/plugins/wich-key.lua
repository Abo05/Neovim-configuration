return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "echasnovski/mini.icons",
    },
    opts = {
        delay = 400, -- Wait 400ms before Which-Key pops up
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
        },
        win = {
            border = "rounded",
            position = "bottom",
            margin = { 1, 1, 1, 1 },
            padding = { 2, 2, 2, 2 },
        },
        layout = {
            height = { min = 4, max = 25 },
            width = { min = 20, max = 50 },
            spacing = 5,
        },
        spec = {
            { "<leader>f", group = "file" },
            { "<leader>g", group = "git" },
            { "<leader>h", group = "harpoon" },
            { "<leader>l", group = "lsp" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}

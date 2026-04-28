return {
    "folke/which-key.nvim",
    event = "VeryLazy", -- Puedes volver a ponerlo sin miedo
    dependencies = {
        "echasnovski/mini.icons",
    },
    opts = {
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

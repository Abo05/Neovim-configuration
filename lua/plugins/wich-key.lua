return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,       -- muestra marcadores (`m` keymaps)
      registers = true,   -- muestra registros (`"` keymaps)
      spelling = {
        enabled = true,   -- sugerencias ortográficas
        suggestions = 20, -- número de sugerencias a mostrar
      },
    },
    window = {
      border = "rounded", -- bordes de la ventana (rounded, single, shadow, none)
      position = "bottom", -- posición de la ventana
      margin = { 1, 1, 1, 1 },
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 5,
    },
    triggers = "auto", -- automáticamente detecta keymaps
    -- puedes registrar categorías para agrupar atajos
    defaults = {
      ["<leader>f"] = { name = "+file" }, -- ejemplo: todos los keymaps bajo <leader>f aparecen agrupados
      ["<leader>g"] = { name = "+git" },
      ["<leader>l"] = { name = "+lsp" },
      ["<leader>h"] = { name = "+harpoon" },
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

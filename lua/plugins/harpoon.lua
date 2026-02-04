
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = {
    -- Añadir archivo actual a Harpoon
    {
      "<leader>H",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Añadir archivo a Harpoon",
    },

    -- Mostrar menú rápido de Harpoon
    {
      "<leader>h",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Abrir menú Harpoon",
    },

    -- Saltar directamente a archivos 1–5
    {
      "<leader>1",
      function() require("harpoon"):list():select(1) end,
      desc = "Ir al archivo 1 (Harpoon)",
    },
    {
      "<leader>2",
      function() require("harpoon"):list():select(2) end,
      desc = "Ir al archivo 2 (Harpoon)",
    },
    {
      "<leader>3",
      function() require("harpoon"):list():select(3) end,
      desc = "Ir al archivo 3 (Harpoon)",
    },
    {
      "<leader>4",
      function() require("harpoon"):list():select(4) end,
      desc = "Ir al archivo 4 (Harpoon)",
    },
    {
      "<leader>5",
      function() require("harpoon"):list():select(5) end,
      desc = "Ir al archivo 5 (Harpoon)",
    },
  },
}

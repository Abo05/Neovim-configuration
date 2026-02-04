
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile"},
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true, -- muestra quién hizo el último cambio en la línea
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)

    -- keymaps útiles
    local gs = package.loaded.gitsigns
    vim.keymap.set("n", "]c", gs.next_hunk, { desc = "Siguiente cambio Git" })
    vim.keymap.set("n", "[c", gs.prev_hunk, { desc = "Cambio Git anterior" })
    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
    vim.keymap.set("n", "<leader>hb", function() gs.blame_line { full = true } end,
      { desc = "Blame línea" })
  end,
}

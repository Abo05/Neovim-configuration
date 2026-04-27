return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  init = function()
    -- 1. Viewer Options
    -- Use "vim.g" instead of "let g:"
    vim.g.vimtex_view_method = "zathura"

    -- NOTE:
    -- You do NOT need "filetype plugin indent on" or "syntax enable".
    -- lazy.nvim and Neovim handle this automatically nowadays.
    -- Including them manually here is unnecessary and can cause issues.
  end
}

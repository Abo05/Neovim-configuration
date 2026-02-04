return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("flutter-tools").setup({
      lsp = {
        on_attach = function(client, bufnr)
          -- AQUÍ DEFINES TUS ATAJOS PARA FLUTTER
          local opts = { buffer = bufnr }
          
          -- Tu atajo para ver el error flotante (diagnóstico)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          
          -- Otros atajos útiles si te faltan:
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Ver documentación
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Ir a definición
        end,
      }
    })
  end,
}

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
-- Paste from system clipboard
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
-- Atajos de teclado globales para LSP (Neovim 0.11+)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf, noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  end,
})

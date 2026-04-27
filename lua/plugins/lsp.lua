return {
  -- Mason: gestor de binarios (esto se mantiene igual)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Integración con la nueva API nativa de Neovim 0.11
  {
    "neovim/nvim-lspconfig",
    dependencies = { 
      "williamboman/mason.nvim", 
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp" 
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      -- Lista de servidores a instalar y activar
      local servers = { "pyright", "clangd", "jdtls" }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })

      -- Nueva forma nativa de configurar servidores (Evita el error de deprecación)
      for _, server in ipairs(servers) do
        -- 1. Configuramos el servidor con sus capacidades
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
        -- 2. Lo activamos globalmente
        vim.lsp.enable(server)
      end
    end,
  },

  -- Autocompletado (Esto se mantiene igual, ya que no genera el error)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
        },
      })
    end,
  },

    { 
        "L3MON4D3/LuaSnip",
        version = "v2.*", 
        build = "make install_jsregexp" 
    },
}

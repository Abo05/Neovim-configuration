return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            "s1n7ax/nvim-window-picker", -- Lo añadimos aquí para que Neo-tree lo detecte siempre
        },
        init = function()
            -- Desactiva Netrw (el explorador por defecto) antes de que Neo-tree inicie
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        -- Quitamos el bloque 'keys' para que no restrinja la carga y detecte 'nvim .'
        config = function(_, opts)
            -- Definimos tu atajo de teclado manualmente aquí
            vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle float<cr>", { desc = "Explorador flotante" })
            require("neo-tree").setup(opts)
        end,
        opts = {
            close_if_last_window = true,
            popup_border_style = "rounded",

            popup = {
                position = "50%",
                size = {
                    width = "80%",
                    height = "80%",
                },
            },

            filesystem = {
                -- CAMBIO AQUÍ: Obliga a Neo-tree a ocupar la ventana entera al hacer `nvim .`
                hijack_netrw_behavior = "open_current", 
                follow_current_file = {
                    enabled = true,
                },
            },

            window = {
                position = "float",
                mappings = {
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                    ["w"] = "open_with_window_picker",
                },
            },

            event_handlers = {
                {
                    event = "file_opened",
                    handler = function()
                        -- Cerramos el explorador al abrir el archivo
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "float" then
                            vim.schedule(function()
                                pcall(require("neo-tree.sources.common.preview").toggle)
                            end)
                        end
                    end,
                },
            },
        },
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
            require("window-picker").setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    bo = {
                        filetype = { "neo-tree", "neo-tree-popup", "notify" },
                        buftype = { "terminal", "quickfix" },
                    },
                },
            })
        end,
    },
}

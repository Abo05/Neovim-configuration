
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "│",       -- El carácter que se usará para las guías de indentación
            tab_char = "│",   -- Si usas tabs, este es el caracter para ellos
        },
        scope = {
            enabled = true,   -- Resalta el nivel de indentación actual
            show_start = true,
            show_end = true,
        },
        whitespace = {
            remove_blankline_trail = true, -- No dibujar guías en líneas vacías
        },
        exclude = {
            filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" }, 
            buftypes = { "terminal", "nofile" }, -- No mostrar guías en estos buffers
        },
    },
}


-- Opciones de visualización
vim.opt.relativenumber = true       -- Números relativos
vim.opt.ruler = true                -- Mostrar posición del cursor
vim.opt.termguicolors = true        -- Colores 24-bit
vim.opt.showmode = false            -- Ocultar "-- INSERT --"
vim.opt.cursorline = true           -- Resalta la línea en la que estas

-- Opciones de búsqueda
vim.opt.hlsearch = true             -- Resaltar búsquedas
vim.opt.incsearch = true            -- Búsqueda incremental
vim.opt.ignorecase = true           -- Ignorar mayúsculas por defecto
vim.opt.smartcase = true            -- Pero sensible a mayúsculas si escribes alguna

-- Opciones de indentación
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Completado
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Mejorar el comportamiento de palabras
vim.cmd("set iskeyword&")

-- Activar detección de tipo de archivo y plugins
vim.cmd("filetype plugin indent on")

-- Disable unused providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.timeout = true
vim.opt.timeoutlen = 500 -- Wait 500ms before timing out a key sequence

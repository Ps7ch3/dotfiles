-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- use luasnip
vim.g.snippets = "luasnip"

-- undodir
local undodir = vim.fn.stdpath('data') .. '/undodir'
vim.fn.mkdir(undodir, 'p')
vim.o.undodir = undodir

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.encoding="utf-8"
vim.o.background = "dark"

-- cmd
vim.cmd "syntax on"
vim.cmd "set number"
vim.cmd "set undofile"

-- global option
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.expandtab = true

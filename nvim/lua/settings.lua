-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- use luasnip
vim.g.snippets = "luasnip"

-- undodir
local undodir = vim.fn.stdpath('data') .. '/undodir'
vim.fn.mkdir(undodir, 'p')
vim.o.undodir = undodir

-- cmd
vim.cmd "syntax on"
vim.cmd "set number"
vim.cmd "set undofile"


local options = {
    tabstop = 4,
    shiftwidth = 4,
    smartindent = true,
    expandtab = true,
    encoding = "utf-8",
    termguicolors = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

local _map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

local pluginKeymap = {}
local opt = {
    noremap = true,
    silent = true
}

-- move among windows
_map('n', '<C-j>', '<C-w>j', opt)
_map('n', '<C-k>', '<C-w>k', opt)
_map('n', '<C-h>', '<C-w>h', opt)
_map('n', '<C-l>', '<C-w>l', opt)

-- bufferline
_map("n", "[b", ":BufferLineCyclePrev<CR>", opt)
_map("n", "[n", ":BufferLineCycleNext<CR>", opt)


-- buffer
_map('n', '<leader>bd', ':bd', {})

-- nvim-tree
_map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)

return pluginKeymap


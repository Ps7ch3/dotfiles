-- km for keymap
local km = vim.api.nvim_set_keymap

vim.g.mapleader = " "

local opts = {
    noremap = true,
    silent = true
}

-- move among windows
km('n', '<C-j>', '<C-w>j', opts)
km('n', '<C-k>', '<C-w>k', opts)
km('n', '<C-h>', '<C-w>h', opts)
km('n', '<C-l>', '<C-w>l', opts)


-- buffer
km('n', '<leader>bd', ':bd<CR>', opts)

-- Navigate buffers
km("n", "<S-l>", ":bnext<CR>", opts)
km("n", "<S-h>", ":bprevious<CR>", opts)

-- ** plugins **
-- bufferline
km("n", "[b", ":BufferLineCyclePrev<CR>", opts)
km("n", "[n", ":BufferLineCycleNext<CR>", opts)

-- nvim-tree
km("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Telescope
km("n", "<leader>gst", ":Telescope git_status<CR>", opts)
km("n", "<leader>gss", ":Telescope git_stash<CR>", opts)

-- neogen
km("n", "<leader>doc", ":Neogen<CR>", opts)

km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

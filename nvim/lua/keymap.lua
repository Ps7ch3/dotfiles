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

-- page move
km("n", "<C-d>", "<C-d>zz", opts)
km("n", "<C-u>", "<C-u>zz", opts)

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

km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

-- register paste
km('v', '<leader>p', '"_dP', opts)

km("i", "<C-b>", "<Left>", opts)
km("i", "<C-f>", "<Right>", opts)
km("i", "<C-a>", "<Home>", opts)
km("i", "<C-e>", "<End>", opts)

km("c", "<C-b>", "<Left>", opts)
km("c", "<C-f>", "<Right>", opts)
km("c", "<C-a>", "<Home>", opts)
km("c", "<C-e>", "<End>", opts)


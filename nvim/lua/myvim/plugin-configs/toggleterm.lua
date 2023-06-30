local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup {
    shade_terminals = true,
    direction = "float",
    close_on_exit = true,
    open_mapping = [[<C-\>]],
    float_opts = {
        border = "curved",
        winblend = 0,
        highlight = {
            border = "Normal",
            background = "Normal",
        }
    }
}

-- keymap for terminal view
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
--

local Terminal = require("toggleterm.terminal").Terminal

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end

local ipython = Terminal:new({ cmd = "ipython", hidden = true })

function _PYTHON_TOGGLE()
	ipython:toggle()
end


local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

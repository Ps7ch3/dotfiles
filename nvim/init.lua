-- load settings
require('settings')
require('keybindings')

require('plugin-configs/bufferline')
require('plugin-configs/nvim-autopairs')
require('plugin-configs/telescope')
require('plugin-configs/indent_blankline')
require('plugin-configs/toggleterm')
require('plugin-configs/Comment')
require('plugin-configs/gitsigns')
require('plugin-configs/nvim-tree')

-- load plugins
require('plugins')
require('feline').setup()
require('todo-comments').setup()

require('lsp/nvim-cmp')
require('lspconfig')['pyright'].setup({})

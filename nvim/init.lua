-- lazy
require('myvim.plugins')

-- basic
require('myvim.settings')
require('myvim.keymap')
require('myvim.colorscheme')

-- load plugins
require('myvim.plugin-configs.bufferline')
require('myvim.plugin-configs.nvim-treesitter')

-- useful tools
require('myvim.plugin-configs.toggleterm')
require('myvim.plugin-configs.telescope')
require('myvim.plugin-configs.nvim-tree')
require('myvim.plugin-configs.whichkey')
require('myvim.plugin-configs.harpoon')
require('myvim.plugin-configs.osc52')
require('myvim.plugin-configs.refactoring')
require('myvim.plugin-configs.mini')

-- prettify
require('myvim.plugin-configs.alpha')
require('myvim.plugin-configs.project')
require('myvim.plugin-configs.lualine')
require('myvim.plugin-configs.indentline')

-- code
require('myvim.plugin-configs.Comment')
require('myvim.plugin-configs.trouble')
require('myvim.plugin-configs.neogen')
require('myvim.plugin-configs.nvim-autopairs')
require('myvim.plugin-configs.surround')
require('myvim.plugin-configs.todo-comments')

-- git
require('myvim.plugin-configs.gitsigns')

-- debug
require('myvim.dap.dap')

-- cmp & snippet
require('myvim.plugin-configs.luasnip')
require('myvim.nvim-cmp')

-- lsp
require('myvim.lsp')

-- load core settings
require('settings')
require('keymap')
require('colorscheme')

-- load plugins
require('plugin-configs.impatient')
require('plugin-configs.bufferline')
require('plugin-configs.nvim-treesitter')

-- useful tools
require('plugin-configs.toggleterm')
require('plugin-configs.telescope')
require('plugin-configs.nvim-tree')
require('plugin-configs.whichkey')
require('plugin-configs.harpoon')
require('plugin-configs.osc52')
require('plugin-configs.refactoring')

-- prettify
require('plugin-configs.alpha')
require('plugin-configs.project')
require('plugin-configs.lualine')
require('plugin-configs.indentline')

-- code
require('plugin-configs.Comment')
require('plugin-configs.trouble')
require('plugin-configs.neogen')
require('plugin-configs.nvim-autopairs')
require('plugin-configs.surround')
require('plugin-configs.todo-comments')

-- git
require('plugin-configs.gitsigns')

-- debug
require('dap.dap')

-- cmp & snippet
require('plugin-configs.luasnip')
require('nvim-cmp')

-- load plugins
require('plugins')

-- lsp
require('lsp')

-- other
require('plugin-configs.obsidian')

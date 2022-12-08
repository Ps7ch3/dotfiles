
local core_plugins = {
    {'wbthomason/packer.nvim'},
    { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end } ,
    {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    } , 
    {'neovim/nvim-lspconfig'},
    {'feline-nvim/feline.nvim'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    ({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"}),
    {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'},
    {'windwp/nvim-autopairs'},
    {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    , {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} }}
    , "lukas-reineke/indent-blankline.nvim"
    , {"akinsho/toggleterm.nvim", tag = '*'}
    , { 'numToStr/Comment.nvim' }
    , {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"}
    , { 'lewis6991/gitsigns.nvim' }

}

return core_plugins

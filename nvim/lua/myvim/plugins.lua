local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])
-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

return lazy.setup({
    -- ts
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },

    -- docs
    {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        dependencies = "nvim-treesitter/nvim-treesitter",
    },

    -- tools
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    },
    { "nvim-telescope/telescope.nvim", dependencies = { { 'nvim-lua/plenary.nvim' } } },
    "akinsho/toggleterm.nvim",
    { "folke/which-key.nvim" },

    -- useful feature
    { 'ojroques/nvim-osc52' },
    { "ThePrimeagen/harpoon", dependencies = 'nvim-lua/plenary.nvim' },
    { "ahmedkhalf/project.nvim" },
    "kylechui/nvim-surround",
    { "akinsho/bufferline.nvim", dependencies = 'nvim-tree/nvim-web-devicons' },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    undo = {
                        side_by_side = true,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.8,
                        },
                        mappings = {
                            i = {
                                ["<s-cr>"] = require("telescope-undo.actions").yank_additions,
                                ["<c-cr>"] = require("telescope-undo.actions").yank_deletions,
                                ["<cr>"] = require("telescope-undo.actions").restore
                            },
                        },
                    },
                },
            })
            require("telescope").load_extension("undo")
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end,
    },

    -- code
    -- ** highlight
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    { 'RRethy/vim-illuminate' },

    { 'windwp/nvim-autopairs' },
    { 'numToStr/Comment.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    { "lukas-reineke/indent-blankline.nvim" },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- ** refactor

    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    },

    -- lsp related --
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    },
    { "jose-elias-alvarez/null-ls.nvim" },

    -- debug
    {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "mfussenegger/nvim-dap-python",
    },

    -- cmp related
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    -- snippet
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    'saadparwaiz1/cmp_luasnip',

    -- beautifier nvim
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- color
    'folke/tokyonight.nvim'
})

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- docs
    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()',
        opt = true,
    }

    -- tools 
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
    use { 'ojroques/nvim-osc52' }
    use { "ThePrimeagen/harpoon", requires = 'nvim-lua/plenary.nvim' }
    use { "ahmedkhalf/project.nvim" }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    use {"akinsho/bufferline.nvim", tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    use {"nvim-telescope/telescope.nvim", tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} }}
    use {"akinsho/toggleterm.nvim", tag = '*'}
    use {"folke/which-key.nvim"}
    use {"gpanders/editorconfig.nvim"}

    -- code
    -- ** highlight
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    use {'RRethy/vim-illuminate'}

    use {'windwp/nvim-autopairs'}
    use { 'numToStr/Comment.nvim' }
    use { 'lewis6991/gitsigns.nvim' }
    use { "lukas-reineke/indent-blankline.nvim" }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- lsp related --
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    use {"jose-elias-alvarez/null-ls.nvim"}

    -- debug
    use {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "mfussenegger/nvim-dap-python",
    }

    -- cmp related
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- ts
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- snippet
    use {"L3MON4D3/LuaSnip"}
    use {"rafamadriz/friendly-snippets"}
    use {'saadparwaiz1/cmp_luasnip'}

    -- beautifier nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons'},
    }

    -- color
    use {'folke/tokyonight.nvim'}

    -- other
    use {'lewis6991/impatient.nvim'} -- profiler
    use {'epwalsh/obsidian.nvim', opt = true} -- obsidian
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        opt = true,
    })

end)

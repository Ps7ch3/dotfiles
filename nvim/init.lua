local function prequire(m)
  local ok, err = pcall(require, m)
  if not ok then return nil, err end
  return err
end

-- load settings
prequire('settings')
prequire('keybindings')

prequire('plugin-configs/bufferline')
prequire('plugin-configs/nvim-autopairs')
prequire('plugin-configs/telescope')
prequire('plugin-configs/toggleterm')
prequire('plugin-configs/Comment')
prequire('plugin-configs/gitsigns')
prequire('plugin-configs/nvim-tree')
prequire('plugin-configs/nvim-treesitter')

-- load plugins
prequire('plugins')
prequire('feline').setup()
prequire('todo-comments').setup()

prequire('lsp/nvim-cmp')
prequire('lspconfig')['pyright'].setup({})

prequire('lsp/sumneko_lua')


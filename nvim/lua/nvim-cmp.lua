-- install cmp-vsnip and vim-vsnip with your plugin manager of choice

-- Setup nvim-cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require('luasnip.loaders.from_vscode').lazy_load()

-- define other bindings and settings in this setup, only the relevant vsnips bindings are shown here
cmp.setup({
  view = {
      entries = {name='custom'}
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- luasnip
    end,
  },
  mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.confirm({ select = true })
          else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
      end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  }),
})


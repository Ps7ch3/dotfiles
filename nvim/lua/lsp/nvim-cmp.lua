
-- install cmp-vsnip and vim-vsnip with your plugin manager of choice

-- Setup nvim-cmp.
local cmp = require'cmp'
require('luasnip.loaders.from_vscode').lazy_load()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local t = function (str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function TableConcat(t1, t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

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
  mapping = cmp.mapping.preset.insert(TableConcat({
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              -- use 'tab' to confirm
              cmp.confirm({ select = true })
          else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
      end, { "i", "s" }),
  }, require'keybindings'.cmp(cmp))),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }),
})


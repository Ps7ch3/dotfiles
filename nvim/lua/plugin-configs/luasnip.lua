if vim.g.snippets ~= "luasnip" then
    return
end

local snip_status_ok, ls = pcall(require, "luasnip")

if not snip_status_ok then
  return
end

local snippet = ls.s
local t = ls.text_node

-- FIXME: didn't work ?
ls.add_snippets("all", {
    snippet("test", t("This is a test"))
})


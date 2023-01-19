local snip_status_ok, ls = pcall(require, "luasnip")

if not snip_status_ok then
    return
end

-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(nil, {
    lua = {
        s(
            "sniphint",
            fmt(
                [[
                {}
                    trig = "{}",
                    name = "{}",
                    dscr = "{}",
                {},
                ]],
                {
                    t("{"), i(1), i(2), i(3), t("}")
                }
            )
        ),
        s(
            {
                trig = "preq",
                name = "preq",
                dscr = "pcall for require",
            },
            fmt(
                [[
                local {}_status_ok, {} = pcall(require, "{}")
                if not {}_status_ok then
                    return
                end
                ]],
                {
                    rep(1), rep(1), i(1), rep(1)
                }
            )
        ),
        s(
            {
                trig = "opreq",
                name = "oprequire",
                dscr = "optional pcall require",
            },
            fmt(
                [[
                local {}_status_ok, {} = pcall(require, "{}")
                if not {}_status_ok then
                    return
                end
                ]],
                {
                    rep(2),
                    c(2, {
                        -- choose split or not
                        rep(1),
                        f(function(mod)
                            local parts = vim.split(mod[1][1], '.', true)
                            return parts[#parts] or ""
                        end, { 1 }),
                    }),
                    i(1),
                    rep(2)
                }
            )
        )
    }
})

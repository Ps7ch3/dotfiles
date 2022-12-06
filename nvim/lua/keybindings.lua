local _map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

local pluginKeymap = {}
local opt = {
    noremap = true,
    silent = true
}

-- move among windows
_map('n', '<C-j>', '<C-w>j', opt)
_map('n', '<C-k>', '<C-w>k', opt)
_map('n', '<C-h>', '<C-w>h', opt)
_map('n', '<C-l>', '<C-w>l', opt)

-- bufferline
_map("n", "[b", ":BufferLineCyclePrev<CR>", opt)
_map("n", "[n", ":BufferLineCycleNext<CR>", opt)


-- buffer
_map('n', '<leader>bd', ':bd', {})

pluginKeymap.cmp = function(cmp)
    return {
        ['<A-,>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    }
end

-- nvim-tree
_map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)
pluginKeymap.nvimTreeList = {
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    { key = "R", action = "refresh" },
}

return pluginKeymap


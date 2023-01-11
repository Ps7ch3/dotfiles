local osc52_status_ok, osc52 = pcall(require, "osc52")
if not osc52_status_ok then
    return
end

require('osc52').setup {
  max_length = 0,  -- Maximum length of selection (0 for no limit)
  silent = false,  -- Disable message on successful copy
  trim = false,    -- Trim text before copy
}

-- In normal mode, <leader>c is an operator that will copy the given text to the clipboard.
-- In normal mode, <leader>cc will copy the current line.
-- In visual mode, <leader>c will copy the current selection.
vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('x', '<leader>c', require('osc52').copy_visual)

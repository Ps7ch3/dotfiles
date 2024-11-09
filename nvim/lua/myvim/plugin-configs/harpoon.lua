local ok, harpoon = pcall(require, "harpoon")
if not ok then
    return
end

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>af", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-s>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>q", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>w", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>e", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

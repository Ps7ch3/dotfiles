local mark_status_ok, mark = pcall(require, "harpoon.mark")
if not mark_status_ok then
    return
end

local ui_status_ok, ui = pcall(require, "harpoon.ui")
if not ui_status_ok then
    return
end

vim.keymap.set("n", "<leader>af", mark.add_file)
vim.keymap.set("n", "<C-s>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>q", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>w", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>e", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>r", function() ui.nav_file(4) end)

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.load_extension('harpoon')

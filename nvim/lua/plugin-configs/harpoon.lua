local mark_status_ok, mark = pcall(require, "harpoon.mark")
if not mark_status_ok then
    return
end

local ui_status_ok, ui = pcall(require, "harpoon.ui")
if not ui_status_ok then
    return
end

vim.keymap.set("n", "<leader>af", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.load_extension('harpoon')

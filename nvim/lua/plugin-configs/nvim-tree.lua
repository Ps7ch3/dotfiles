local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("Not found nvim-tree")
  return
end

local list_keys = require("keybindings").nvimTreeList

nvim_tree.setup({
    git = {
        enable = false,
    },
    view = {
        side = 'left',
        mappings = {
            list = list_keys
        }
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = false,
        },
    },
})

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("Not found nvim-tree")
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    git = {
        enable = false,
    },
    view = {
        side = 'left',
        mappings = {
            list = {
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            }
        }
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = false,
        },
    },
})

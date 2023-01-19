local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("Not found nvim-tree")
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local myicons_status_ok, myicons = pcall(require, "myicons")
if not myicons_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    git = {
        enable = true,
        ignore = false,
        timeout = 200,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = myicons.diagnostics.BoldHint,
            info = myicons.diagnostics.BoldInformation,
            warning = myicons.diagnostics.BoldWarning,
            error = myicons.diagnostics.BoldError,
        },
    },
    view = {
        width = 30,
        side = 'left',
        mappings = {
            list = {
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            }
        },
        number = true,
        relativenumber = true,
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = false,
        },
    },
    renderer = {
        highlight_git = true,
        icons = {
            webdev_colors = true,
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
            glyphs = {
                default = myicons.ui.Text,
                symlink = myicons.ui.FileSymlink,
                git = {
                    deleted = myicons.git.FileDeleted,
                    ignored = myicons.git.FileIgnored,
                    renamed = myicons.git.FileRenamed,
                    staged = myicons.git.FileStaged,
                    unmerged = myicons.git.FileUnmerged,
                    unstaged = myicons.git.FileUnstaged,
                    untracked = myicons.git.FileUntracked,
                },
                folder = {
                    default = myicons.ui.Folder,
                    empty = myicons.ui.EmptyFolder,
                    empty_open = myicons.ui.EmptyFolderOpen,
                    open = myicons.ui.FolderOpen,
                    symlink = myicons.ui.FolderSymlink,
                },
            },
        }
    }
})

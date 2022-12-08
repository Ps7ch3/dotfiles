local plugin_loader = {}

local utils = require "utils"
local join_paths = utils.join_paths

local compile_path = join_paths(vim.fn.stdpath('config'), "plugin", "packer_compiled.lua")

function plugin_loader.init(opts)
    opts = opts or {}

    local install_path = opts.install_path
        or join_paths(vim.fn.stdpath "data", "site", "pack", "packer", "start", "packer.nvim")

    local init_opts = {
        package_root = opts.package_root or join_paths(vim.fn.stdpath "data", "site", "pack"),
        max_jobs = 100,
        log = { level = "warn" },
        git = {
          clone_timeout = 120,
        },
        display = {
          open_fn = function()
            return require("packer.util").float { border = "rounded" }
          end,
        },
    }

    if not utils.is_directory(install_path) then
        print "Initializing first time setup"
        print "Installing packer"
        print(vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd "packadd packer.nvim"
    end

    local status_ok, packer = pcall(require, "packer")
    if status_ok then
        packer.on_complete = vim.schedule_wrap(function()
          require("lvim.utils.hooks").run_on_packer_complete()
        end)
        packer.init(init_opts)
    end
end

-- packer expects a space separated list
local function pcall_packer_command(cmd, kwargs)
    local status_ok, msg = pcall(function()
        require("packer")[cmd](unpack(kwargs or {}))
    end)
    if not status_ok then
        print (cmd .. " failed with: " .. vim.inspect(msg))
    end
end

function plugin_loader.compile()
    vim.api.nvim_create_autocmd("User", {
        pattern = "PackerCompileDone",
        once = true,
        callback = function()
            if utils.is_file(compile_path) then
                print "finished compiling packer_compiled.lua"
            end
        end,
    })
    pcall_packer_command "compile"
end

function plugin_loader.recompile()
    plugin_loader.cache_clear()
    plugin_loader.compile()
end

function plugin_loader.reload(configurations)
    _G.packer_plugins = _G.packer_plugins or {}
    for k, v in pairs(_G.packer_plugins) do
        if k ~= "packer.nvim" then
            _G.packer_plugins[v] = nil
        end
    end
    plugin_loader.load(configurations)

    plugin_loader.ensure_plugins()
end

function plugin_loader.load(configurations)
    local packer_available, packer = pcall(require, "packer")
    if not packer_available then
        print "skipping loading plugins until Packer is installed"
        return
    end
    local status_ok, _ = xpcall(function()
        packer.reset()
        packer.startup(function(use)
            for _, plugins in ipairs(configurations) do
                for _, plugin in ipairs(plugins) do
                    use(plugin)
                end
            end
        end)
    end, debug.traceback)

    if not status_ok then
        print "problems detected while loading plugins' configurations"
        print (debug.traceback())
    end
end

return plugin_loader

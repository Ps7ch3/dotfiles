local M = {}

local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"

local sep
if jit.os == "Windows" then
  sep = "\\"
else
  sep = "/"
end

local loadlib = package.loadlib

-- Copied from neovim/src/nvim/lua/vim.lua
function M.load_package(name)
  local basename = name:gsub("%.", sep)
  local paths = { "lua" .. sep .. basename .. ".lua", "lua" .. sep .. basename .. sep .. "init.lua" }

  local found = vim.api.nvim__get_runtime(paths, false, {is_lua=true})
  if #found > 0 then
    local f, err = loadfile(found[1])
    return f or error(err)
  end

  local so_paths = {}
  for _, trail in ipairs(vim._so_trails) do
    local path = "lua" .. trail:gsub("?", basename) -- so_trails contains a leading slash
    table.insert(so_paths, path)
  end

  found = vim.api.nvim__get_runtime(so_paths, false, {is_lua=true})
  if #found > 0 then
    -- Making function name in Lua 5.1 (see src/loadlib.c:mkfuncname) is
    -- a) strip prefix up to and including the first dash, if any
    -- b) replace all dots by underscores
    -- c) prepend "luaopen_"
    -- So "foo-bar.baz" should result in "luaopen_bar_baz"
    local dash = name:find("-", 1, true)
    local modname = dash and name:sub(dash + 1) or name
    local f, err = loadlib(found[1], "luaopen_" .. modname:gsub("%.", "_"))
    return f or error(err)
  end
  return nil
end

---Join path segments that were passed as input
---@return string
function M.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

function M.run_on_packer_complete()
  vim.api.nvim_exec_autocmds("User", { pattern = "PackerComplete" })
end

--- Checks whether a given path exists and is a file.
--@param path (string) path to check
--@returns (bool)
function M.is_file(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "file" or false
end

--- Checks whether a given path exists and is a directory
--@param path (string) path to check
--@returns (bool)
function M.is_directory(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory" or false
end

return M

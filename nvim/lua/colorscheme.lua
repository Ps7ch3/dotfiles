local cs = "tokyonight-moon"

local ok, _ = pcall(vim.cmd, "colorscheme " .. cs)
if not ok then
    return
end

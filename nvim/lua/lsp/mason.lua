local ok, mason = pcall(require, "mason")
if not ok then
    return
end

local ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if not ok then
    return
end

mason.setup()
mason_lsp_config.setup()

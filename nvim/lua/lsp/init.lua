local ok, _ = pcall(require, "lspconfig")
if not ok then
    return
end

require("lsp.mason")
require("lsp.handlers").setup()

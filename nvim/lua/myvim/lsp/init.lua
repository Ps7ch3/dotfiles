local ok, _ = pcall(require, "lspconfig")
if not ok then
    return
end

require("myvim.lsp.mason")
require("myvim.lsp.handlers").setup()
require("myvim.lsp.null-ls")

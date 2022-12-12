local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.setup = function()
end

M.on_attach = function(client, bufnr)
    local illuminate_status_ok, illuminate = pcall(require, "illuminate")
    if not illuminate_status_ok then
        return
    end

    illuminate.on_attach(client)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

return M

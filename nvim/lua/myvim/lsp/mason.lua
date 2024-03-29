local servers = {
    "lua_ls",
    "pyright",
    "yamlls",
    "jsonls",
}

local status_mason_ok, mason = pcall(require, "mason")
if not status_mason_ok then
    return
end

local status_mason_lsp_config, mason_lsp_config = pcall(require, "mason-lspconfig")
if not status_mason_lsp_config then
    return
end

mason.setup()
mason_lsp_config.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- config

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in ipairs(servers) do
    local opts = {
        on_attach = require("myvim.lsp.handlers").on_attach,
        capabilities = require("myvim.lsp.handlers").capabilities,
    }

    local need_extra_config, server_custom_opts = pcall(require, "myvim.lsp.settings." .. server)
    if need_extra_config then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    lspconfig[server].setup(opts)
end


-- Mason for handling LSP installation
local mason_status, mason = pcall(require, 'mason')
if not mason_status then
    return
end
mason.setup()

local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status then
    return
end

mason_lspconfig.setup({
    ensure_installed = {
        "html",
        "cssls",
        "sumneko_lua",
        "pylsp",
        "pyright",
        "clangd",
        "sqlls",
        -- "jdtls",
    }
})


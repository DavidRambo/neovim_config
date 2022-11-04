-- Set up lspconfig.
local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- enable keybindings for lsp server
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", " dh", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    vim.keymap.set("n", " d]", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set("n", " d[", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", " dn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", " dp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", " dl", "<cmd>Telescope diagnostics<CR>", opts)
    vim.keymap.set("n", " rn", "<cmd>Lspsaga rename<CR>", opts)
end

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                -- library = vim.api.nvim_get_runtime_file("", true),
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                }
            },
        }
    }
}

lspconfig["clangd"].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig["pyright"].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig["pylsp"].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.sqlls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

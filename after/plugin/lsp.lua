-- Mason for handling LSP installation
require("mason").setup()
require("mason-lspconfig").setup()

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
capabilities = capabilities

local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", " dn", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", " dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", " dl", "<cmd>Telescope diagnostics<CR>", { buffer = 0 })
    vim.keymap.set("n", " r", vim.lsp.buf.rename, { buffer = 0 })
end

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

require("lspconfig").sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
        }
    }
}
require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
-- require("lspconfig").pyright.setup {
--     on_attach = on_attach,
-- }
require("lspconfig").pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require("lspconfig").sqlls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Setup nvim-cmp
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        -- { name = "buffer" },
    }), {
        { name = 'buffer' }
    },
})

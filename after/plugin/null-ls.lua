local setup, null_ls = pcall(require, "null-ls")
if not setup then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.black,
        formatting.prettier.with({
            filetypes = { "html", "json", "yaml", "markdown" },
        }),
        -- formatting.clang_format.with({
        -- 	disabled_filetypes = { "java" },
        -- }),
        diagnostics.flake8,
        diagnostics.mypy,
        --[[ diagnostics.pylint.with({
			diagnostic_config = {
				underline = false,
				virtual_text = false,
				signs = true,
				severity_sort = true,
			},
		}), ]]
    },
    -- log_level = "error",
    -- configure format on save
    on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            --  only use null-ls for formatting instead of lsp server
                            return client.name == "null-ls"
                        end,
                        bufnr = bufnr,
                    })
                end,
            })
        end
    end,
})

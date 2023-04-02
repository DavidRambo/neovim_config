-- Mason for handling LSP installation
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

mason.setup()

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "html",
    "cssls",
    "lua_ls",
    -- "pylsp",
    "clangd",
    "sqlls",
    -- "jdtls",
  },
})

mason_null_ls.setup({
  ensure_installed = {
    "stylua",
    "clang_format",
    "black",
    "ruff",
  },
})

-- Set up lspconfig.
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local navbuddy = require("nvim-navbuddy")

local capabilities = cmp_nvim_lsp.default_capabilities()

-- enable keybindings for lsp server
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.diagnostic.config({
    -- virtual_text = {
    --   source = "always", -- Or "if_many"
    -- },
    float = {
      source = "always", -- Or "if_many"
    },
  })

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>dh", vim.diagnostic.open_float, opts)
  -- vim.keymap.set("n", " dh", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  -- vim.keymap.set("n", " d]", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  -- vim.keymap.set("n", " d[", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  vim.keymap.set("n", " dn", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", " dp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", " dl", "<cmd>Telescope diagnostics<CR>", opts)
  vim.keymap.set("n", "<C-c>", vim.lsp.buf.code_action, opts)
  -- vim.keymap.set("n", " rn", "<cmd>Lspsaga rename<CR>", opts)
  vim.keymap.set("n", " rn", vim.lsp.buf.rename, opts)

  navbuddy.attach(client, bufnr)
end

vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- library = vim.api.nvim_get_runtime_file("", true),
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

lspconfig["clangd"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

local util = require("lspconfig/util")

local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
  if match ~= "" then
    local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
    -- Or, if using nested poetry environments (requires poetry 1.3.0):
    -- local venv = vim.fn.trim(vim.fn.system('poetry --directory ' .. workspace .. ' env info -p'))
    return path.join(venv, "bin", "python")
  end

  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

-- Configure `ruff-lsp`.
-- local configs = require("lspconfig.configs")
-- if not configs.ruff_lsp then
-- 	configs.ruff_lsp = {
-- 		default_config = {
-- 			cmd = { "ruff-lsp" },
-- 			filetypes = { "python" },
-- 			root_dir = require("lspconfig").util.find_git_ancestor,
-- 			init_options = {
-- 				settings = {
-- 					args = {},
-- 				},
-- 			},
-- 		},
-- 	}
-- end
-- require("lspconfig").ruff_lsp.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

require("lspconfig").pyright.setup({
  on_attach = function()
    require("lsp_signature").on_attach({
      hint_enable = false,
    })
  end,
  on_init = function(client)
    client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end,
})

lspconfig.pyright.before_init = function(params, config)
  local Path = require("plenary.path")
  local venv = Path:new((config.root_dir:gsub("/", Path.path.sep)), ".venv")
  if venv:joinpath("bin"):is_dir() then
    config.settings.python.pythonPath = tostring(venv:joinpath("bin", "python"))
  else
    config.settings.python.pythonPath = tostring(venv:joinpath("Scripts", "python.exe"))
  end
end

lspconfig["pyright"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- lspconfig["pylsp"].setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				pycodestyle = {
-- 					ignore = { "W391", "E226", "E501" },
-- 					maxLineLength = 88,
-- 				},
-- 				pyflakes = { enabled = false },
-- 				pylint = { enabled = false },
-- 			},
-- 		},
-- 	},
-- })

lspconfig.sqlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["jdtls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "jdtls",
    "-configuration",
    "/home/runner/.cache/jdtls/config",
    "-data",
    "/home/runner/.cache/jdtls/workspace",
  },
  settings = {
    java = {
      import = { enabled = true },
    },
  },
})

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- For conciseness
local n_remap = function(lhs, rhs)
	vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
end

local i_remap = function(lhs, rhs)
	vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true, silent = true })
end

local v_remap = function(lhs, rhs)
	vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true, silent = true })
end

-- map leader to space
vim.g.mapleader = " "

-- handling word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "<Up>", "v:count == 0 ? 'g<Up>' : '<Up>'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Down>",
	"v:count == 0 ? 'g<Down>' : '<Down>'",
	{ noremap = true, expr = true, silent = true }
)

-- map save to doom emacs bindings
n_remap(" fs", ":w<CR>")

-- toggle nvim-tree
n_remap("<leader>e", ":NvimTreeToggle<CR>")

-- Emacs Home and End bindings
i_remap("<C-a>", "<ESC>I")
i_remap("<C-e>", "<ESC>A")

-- Delete whole word in insert mode
i_remap("<C-BS>", "<C-w>")

-- BUFFERS
-- See telescope section below for view buffers
n_remap("<leader>bn", "<cmd>bnext<CR>")
n_remap("<leader>bp", "<cmd>bprevious<CR>")
n_remap("<leader>b]", "<cmd>bnext<CR>")
n_remap("<leader>b[", "<cmd>bprevious<CR>")
-- delete buffer
n_remap("<leader>bk", "<cmd>bd<CR>")

-- close active tab/window
n_remap("<leader>c", ":close<CR>")

-- Tabs
n_remap("<leader>tn", ":tabnew<CR>")
n_remap("<leader>th", ":tabp<CR>")
n_remap("<leader>to", ":tabn<CR>")

-- Windows
n_remap("<leader>wv", "<C-w>v")
n_remap("<leader>wn", "<C-w><Left>")
n_remap("<leader>wi", "<C-w><Right>")
n_remap("<leader>wu", "<C-w><Up>")
n_remap("<leader>we", "<C-w><Down>")

-- Telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>.", builtin.find_files, {})
vim.keymap.set("n", "<leader>,", builtin.buffers, {})
vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>sp", builtin.live_grep, {})
vim.keymap.set("n", "<leader>st", builtin.treesitter, {})
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
-- vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, {})

-- Filter Diagnostic Severity
n_remap("<leader>df", "<cmd>:lua require('user.filter-diagnostics').set_level(vim.diagnostic.severity.ERROR)<CR>")
n_remap("<leader>dw", "<cmd>:lua require('user.filter-diagnostics').set_level(vim.diagnostic.severity.WARN)<CR>")

-- Hop --
-- normal mode like easymotion
n_remap("<leader><leader>b", "<cmd>HopWordBC<CR>")
n_remap("<leader><leader>w", "<cmd>HopWordAC<CR>")
n_remap("gs", "<cmd>HopChar2<CR>")
n_remap("<leader><leader>s", "<cmd>HopChar2AC<CR>")
n_remap("<leader><leader>S", "<cmd>HopChar2BC<CR>")
n_remap("<leader><leader>j", "<cmd>HopLineAC<CR>")
n_remap("<leader><leader>k", "<cmd>HopLineBC<CR>")
n_remap("<leader><leader>[", "<cmd>HopLineStart<CR>")
n_remap("<leader><leader>/", "<cmd>HopPattern<CR>")

-- visual mode like easymotion
v_remap("<leader><leader>b", "<cmd>HopWordBC<CR>")
v_remap("<leader><leader>w", "<cmd>HopWordAC<CR>")
v_remap("<leader><leader>s", "<cmd>HopChar2AC<CR>")
v_remap("<leader><leader>S", "<cmd>HopChar2BC<CR>")
v_remap("<leader><leader>j", "<cmd>HopLineAC<CR>")
v_remap("<leader><leader>k", "<cmd>HopLineBC<CR>")
v_remap("<leader><leader>[", "<cmd>HopLineStart<CR>")

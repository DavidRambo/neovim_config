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

n_remap("<C-d>", "<C-d>zz")
n_remap("<C-u>", "<C-u>zz")
n_remap("n", "nzzzv")
n_remap("N", "Nzzzv")

-- keep that yank for more pasting
vim.keymap.set("x", "<leader>p", '"_dP')

-- from asbjornHaland by way of theprimeagen
-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

n_remap("Q", "<nop>")

-- map save to doom emacs bindings
n_remap("<leader>fs", ":w<CR>")

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

-- Tabs
-- n_remap("<leader>tn", ":tabnew<CR>")
-- n_remap("<leader>th", ":tabp<CR>")
-- n_remap("<leader>to", ":tabn<CR>")

-- Windows
n_remap("<leader>ws", ":split<CR>:Telescope buffers<CR>")
n_remap("<leader>wv", ":vsplit<CR>:Telescope buffers<CR>")
n_remap("<leader>wn", "<C-w><Left>")
n_remap("<leader>wi", "<C-w><Right>")
n_remap("<leader>wu", "<C-w><Up>")
n_remap("<leader>we", "<C-w><Down>")
n_remap("<leader>wb", "<C-w>=")
n_remap("<leader>wo", ":only")
n_remap("<leader>wx", ":close<CR>")

-- Telescope --
local builtin = require("telescope.builtin")
n_remap("<leader>.", "<cmd>:lua require('user.tele').file_finder()<CR>")
n_remap("<leader>,", "<cmd>:Telescope buffers<CR>")
n_remap("<leader>fb", ":Telescope file_browser<CR>")
n_remap("<leader>fp", "<cmd>:lua require('user.tele').edit_nvim_conf()<CR>")
n_remap("<leader>ff", ":Telescope find_files<CR>")
n_remap("<leader>fq", "<cmd>:lua require('user.tele').find_qmk()<CR>")
n_remap("<leader>sh", "<cmd>:Telescope help_tags<CR>")
n_remap("<leader>sp", "<cmd>:Telescope live_grep<CR>")
n_remap("<leader>ss", "<cmd>:Telescope treesitter<CR>")
n_remap("<leader>sk", ":Telescope keymaps<CR>")
n_remap("<leader>sd", "<cmd>:Telescope lsp_definitions<CR>")
n_remap("<leader>sr", "<cmd>:Telescope resume<CR>")
vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, {})
n_remap("<leader>ft", ":TodoTelescope<CR>")

-- Filter Diagnostic Severity
n_remap("<leader>df", "<cmd>:lua require('user.filter-diagnostics').set_level(vim.diagnostic.severity.ERROR)<CR>")
n_remap("<leader>dw", "<cmd>:lua require('user.filter-diagnostics').set_level(vim.diagnostic.severity.WARN)<CR>")

-- Zen-mode
n_remap("<leader>tz", "<cmd>ZenMode<CR>")

-- Neorg
n_remap("<leader>tc", "<cmd>:Neorg toggle-concealer<CR>")

-- move.nvim
n_remap("<C-j>", ":MoveLine(1)<CR>")
n_remap("<C-k>", ":MoveLine(-1)<CR>")
v_remap("<C-j>", ":m '>+1<CR>gv=gv")
v_remap("<C-k>", ":m '>-2<CR>gv=gv")

-- Git --
n_remap("<space>gg", ":Neogit<CR>")

-- Hop --
-- normal mode like easymotion
-- n_remap("<leader><leader>b", "<cmd>HopWordBC<CR>")
-- n_remap("<leader><leader>w", "<cmd>HopWordAC<CR>")
-- n_remap("gs", "<cmd>HopChar2<CR>")
-- n_remap("<leader><leader>s", "<cmd>HopChar2AC<CR>")
-- n_remap("<leader><leader>S", "<cmd>HopChar2BC<CR>")
-- n_remap("<leader><leader>j", "<cmd>HopLineAC<CR>")
-- n_remap("<leader><leader>k", "<cmd>HopLineBC<CR>")
-- n_remap("<leader><leader>[", "<cmd>HopLineStart<CR>")
-- n_remap("<leader><leader>/", "<cmd>HopPattern<CR>")

-- visual mode like easymotion
-- v_remap("<leader><leader>b", "<cmd>HopWordBC<CR>")
-- v_remap("<leader><leader>w", "<cmd>HopWordAC<CR>")
-- v_remap("<leader><leader>s", "<cmd>HopChar2AC<CR>")
-- v_remap("<leader><leader>S", "<cmd>HopChar2BC<CR>")
-- v_remap("<leader><leader>j", "<cmd>HopLineAC<CR>")
-- v_remap("<leader><leader>k", "<cmd>HopLineBC<CR>")
-- v_remap("<leader><leader>[", "<cmd>HopLineStart<CR>")

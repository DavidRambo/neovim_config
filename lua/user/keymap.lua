vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

-- For conciseness
local n_remap = function(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end

local i_remap = function(lhs, rhs)
    vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true })
end

-- map leader to space
vim.g.mapleader = " "

-- handling word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'",
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'",
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', "v:count == 0 ? 'g<Up>' : '<Up>'",
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', "v:count == 0 ? 'g<Down>' : '<Down>'",
    { noremap = true, expr = true, silent = true })

-- map save to doom emacs bindings
n_remap(' fs', ':w<CR>')

-- toggle nvim-tree
n_remap('<leader>e', ':NvimTreeToggle<CR>')

-- Emacs Home and End bindings
i_remap('<C-a>', '<ESC>I')
i_remap('<C-e>', '<ESC>A')

-- BUFFERS
-- See telescope se ction below for view buffers
n_remap('<leader>bn', '<cmd>bnext<CR>')
n_remap('<leader>bp', '<cmd>bprevious<CR>')
-- delete buffer
n_remap('<leader>bk', '<cmd>bd<CR>')

-- close active tab/window
n_remap('<leader>c', ':close<CR>')

-- Tabs
n_remap('<leader>tn', ':tabnew<CR>')
n_remap('<leader>th', ':tabp<CR>')
n_remap('<leader>to', ':tabn<CR>')

-- Windows
n_remap("<leader>wv", "<C-w>v")
n_remap('<leader>wn', '<C-w><Left>')
n_remap('<leader>wi', '<C-w><Right>')
n_remap('<leader>wu', '<C-w><Up>')
n_remap('<leader>we', '<C-w><Down>')

-- Telescope --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>.', builtin.find_files, {})
vim.keymap.set('n', '<leader>,', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>sp', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_ind, {})

-- Formatter --
-- n_remap('<leader>F', ':Format<CR>')

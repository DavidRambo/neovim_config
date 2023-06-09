local status, doom = pcall(require, "doom-one")
if not status then
  return
end

-- doom.setup({
--   function()
--     vim.g.doom_one_cursor_coloring = true
--     vim.g.doom_one_terminal_colors = true
--     vim.g.doom_one_italic_comments = true
--     vim.g.doom_one_enable_treesitter = true
--     vim.g.doom_one_diagnostics_text_color = false
--     vim.g.doom_one_transparent_background = false
--     -- Plugins integration
--     vim.g.doom_one_plugin_neorg = true
--     vim.g.doom_one_plugin_barbar = false
--     vim.g.doom_one_plugin_telescope = true
--     vim.g.doom_one_plugin_neogit = false
--     vim.g.doom_one_plugin_nvim_tree = true
--     vim.g.doom_one_plugin_dashboard = true
--     vim.g.doom_one_plugin_startify = false
--     vim.g.doom_one_plugin_whichkey = true
--     vim.g.doom_one_plugin_indent_blankline = false
--     vim.g.doom_one_plugin_vim_illuminate = true
--     vim.g.doom_one_plugin_lspsaga = true
--   end,
-- })

vim.cmd.colorscheme("doom-one")

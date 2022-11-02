local setup, onedark = pcall(require, "onedark")
if not setup then
    return
end

onedark.setup {
    style = 'dark',
    transparent = false,
    term_colors = true,
    toggle_style_key = '<leader>ts',
}

vim.cmd("colorscheme onedark")

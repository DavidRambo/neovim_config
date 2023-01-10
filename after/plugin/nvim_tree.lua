local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "﬌",
					arrow_open = "",
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})

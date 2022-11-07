require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "python" },
	},
	-- A list of parser names
	ensure_installed = {
		"c",
		"python",
		"lua",
		"bash",
		"vim",
		"dockerfile",
		"html",
		"json",
		"java",
		"javascript",
		"markdown",
		"scheme",
		"gitignore",
		"bash",
	},

	sync_install = false,
})

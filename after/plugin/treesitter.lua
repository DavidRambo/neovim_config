require("nvim-treesitter.configs").setup({
	-- A list of languages to be installed
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
		"help",
	},

	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
		disable = { "python" },
	},
	sync_install = false,
})

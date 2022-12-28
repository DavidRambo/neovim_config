local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- local themes = require("telescope.themes")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				-- ["<C-k>"] = actions.move_selection_previous,
				-- ["<C-j>"] = actions.move_selection_next,
				["<esc>"] = actions.close,
			},
		},
		file_ignore_patterns = {
			".git/.*",
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

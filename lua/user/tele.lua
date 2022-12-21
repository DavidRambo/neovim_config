local M = {}

local themes = require("telescope.themes")

-- Edit neovim config
M.edit_nvim_conf = function()
	require("telescope.builtin").git_files({
		shorten_path = true,
		cwd = "~/.config/nvim/",
		prompt = "~ neovim config ~",
		height = 10,

		layout_strategy = "horizontal",
		layout_options = {
			preview_width = 0.75,
		},
	})
end

-- Fall back to find_files if no .git directory.
-- Source: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
M.file_finder = function()
	local opts = themes.get_ivy({
		shorten_path = true,
		layout_strategy = "horizontal",
		layout_options = {
			preview_width = 0.75,
		},
	})
	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		require("telescope.builtin").git_files(opts)
	else
		require("telescope.builtin").find_files(opts)
	end
end

return M

local M = {}

-- Edit neovim config
M.edit_nvim_conf = function()
	-- local opts = themes.get_ivy = {}
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

return M

local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
	return
end

-- lualine.setup()
lualine.setup({
	options = {
		-- theme = "doom-one",
		theme = "catppuccin",
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "filename", "branch", separator = { left = "" }, right_padding = 2 },
		},
		-- lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
})

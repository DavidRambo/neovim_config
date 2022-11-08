local which_key_setup, wk = pcall(require, "which-key")
if not which_key_setup then
	return
end

wk.setup()

wk.register({
	{
		["<leader><leader>"] = {
			name = "Hop",
		},
	},
	["<leader>d"] = {
		name = "diagnostics",
		f = "Filter to errors only",
		n = "Next diagnostic",
		p = "Previous diagnostic",
	},
	["<leader>b"] = {
		name = "buffers",
	},
	{
		["<leader>f"] = {
			name = "File",
			s = { "Save" },
		},
	},
	{
		["<leader>r"] = {
			name = "re-",
		},
	},
	["<leader>s"] = {
		name = "search",
		p = { "Telescope project" },
		h = { "Telescope help tags" },
	},
	["<leader>."] = { "Find File" },
	["<leader>,"] = { "Find Buffer" },
	["<leader>t"] = {
		name = "Tabs",
		n = { "Create Tab" },
		h = { "Previous Tab" },
		o = { "Next Tab" },
	},
	["<leader>w"] = {
		name = "Windows",
		vq = { "Vertical Split" },
		s = { "Horizontal Split" },
		n = { "Focus Left" },
		i = { "Focus Right" },
		u = { "Focus Up" },
		e = { "Focus Down" },
	},
})

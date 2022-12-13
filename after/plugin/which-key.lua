local which_key_setup, wk = pcall(require, "which-key")
if not which_key_setup then
	return
end

wk.setup()

wk.register({
	-- {
	-- 	["<leader><leader>"] = {
	-- 		name = "Hop",
	-- 	},
	-- },
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
		t = { "Treesitter symbols" },
	},
	["<leader>."] = { "Find File" },
	["<leader>,"] = { "Find Buffer" },
	["<leader>t"] = {
		name = "Toggle",
		-- n = { "Create Tab" },
		-- h = { "Previous Tab" },
		-- o = { "Next Tab" },
		c = { "Neorg Concealer" },
	},
	["<leader>w"] = {
		name = "Windows",
		v = { "Vertical Split" },
		s = { "Horizontal Split" },
		n = { "Focus Left" },
		i = { "Focus Right" },
		u = { "Focus Up" },
		e = { "Focus Down" },
	},
	["gt"] = {
		name = "Neorg GTD",
		c = { "Task Cancelled" },
		d = { "Task Done" },
		h = { "Task On Hold" },
		i = { "Task Important" },
		p = { "Task Pending" },
		r = { "Task Recurring" },
		u = { "Task Undone" },
	},
})

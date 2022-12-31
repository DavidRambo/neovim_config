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
	["<leader>f"] = {
		name = "File",
		s = { "Save" },
		f = { "Find File" },
		p = { "Find Nvim Config File" },
	},
	["<leader>m"] = {
		name = "Neorg modes",
		n = { "norg" },
		h = { "traverse-heading" },
	},
	{
		["<leader>r"] = {
			name = "re-",
		},
	},
	["<leader>s"] = {
		name = "search",
		p = { "[S]earch [P]roject" },
		h = { "[S]earch [H]elp tags" },
		r = { "[R]esume [S]earch" },
		t = { "[S]earch [T]reesitter symbols" },
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

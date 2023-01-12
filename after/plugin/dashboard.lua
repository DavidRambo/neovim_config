local dash_status, db = pcall(require, "dashboard")
if not dash_status then
	return
end

db.custom_center = {
	--[[ {
		icon = "  ",
		desc = "Recently latest session                  ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	}, ]]
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		-- action = "DashboardFindHistory",
		shortcut = "SPC s o",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		-- action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		-- action = "Telescope file_browser",
		shortcut = "SPC f b",
	},
	--[[ {
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	}, ]]
	{
		icon = "  ",
		desc = "Open Neovim Config                      ",
		-- action = "Telescope dotfiles path=" .. home .. "/.config",
		shortcut = "SPC f p",
	},
}

db.header_pad = 2

db.custom_header = {
	[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
	[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
	[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
	[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
}

db.center_pad = 3

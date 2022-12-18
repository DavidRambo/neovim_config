local status, neorg = pcall(require, "neorg")
if not status then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {},
		["core.norg.manoeuvre"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					dropbox = "~/Dropbox (Maestral)/neorg/",
				},
			},
		},
		["core.keybinds"] = {
			config = {
				hook = function(keybinds)
					-- Mappings for moving items up and down
					keybinds.map("norg", "n", "M-j", "core.norg.manoeuvre.move_item_down")
					keybinds.map("norg", "n", "M-k", "core.norg.manoeuvre.move_item_up")
				end,
			},
		},
	},
})

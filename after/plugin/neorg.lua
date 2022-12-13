local status, neorg = pcall(require, "neorg")
if not status then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {},
		["core.keybinds"] = {},
	},
})

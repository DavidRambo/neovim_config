-- RRethy/vim-illuminate
-- Modify default configuration to ignore .md, .org, and .norg

require("illuminate").configure({
	filetypes_denylist = {
		"dirvish",
		"figitive",
		"md",
		"org",
		"norg",
	},
})

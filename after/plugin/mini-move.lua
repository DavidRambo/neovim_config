local move_status, mini_move = pcall(require, "mini.move")
if not move_status then
	return
end

mini_move.setup({
	mappings = {
		left = "<M-h>",
		right = "<M-l>",
		down = "<M-j>",
		up = "<M-k>",
	},
})

local move_status, mini_bracketed = pcall(require, "mini.bracketed")
if not move_status then
	return
end

mini_bracketed.setup()

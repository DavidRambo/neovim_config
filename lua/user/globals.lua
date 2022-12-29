-- Source: TJ DeVries, "Neovim Lua Plugin From Scratch" (yt)
-- To run:
-- :lua P(v)

-- [[
-- When passing a lua table to ~:lua print()~
-- it returns the pointer to the lua table.
-- By passing the table first through ~vim.inspect()~
-- we get a string representation of the table.
-- ]]
P = function(v)
	print(vim.inspect(v))
	return v
end

-- [[
-- A function to reload a module, which is useful when iterating
-- on a plugin.
-- ]]
RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

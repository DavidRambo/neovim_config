local status, indent = pcall(require, "indent_blankline")
if not status then
  return
end

indent.setup({
  show_current_context = true,
  -- show_current_context_start = true,
  --[[ Note: underline appearance is a property of the terminal.
	In wezterm: underline_thickness
	In kitty: modify_font ]]

  char = "┊",
  show_trailing_blankline_indent = false,
  filetype_exclude = { "dashboard" },
})

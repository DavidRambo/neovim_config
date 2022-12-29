local status, neorg = pcall(require, "neorg")
if not status then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {
			config = {
				dim_code_blocks = {
					enabled = true,
					width = "content",
					padding = {
						right = 2,
					},
					conceal = true,
				},
			},
			icons = {
				todo = {
					enable = true,
					undone = {
						icon = " ", -- this does nothing
					},
				},
				-- heading = {},
			},
		},
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
				default_keybinds = true,
				neorg_leader = " ",
				hook = function(keybinds)
					keybinds.map_event_to_mode("norg", {
						n = {

							-- Mappings for GTD
							{ "gtu", "core.norg.qol.todo_items.todo.task_undone" },
							{ "gtp", "core.norg.qol.todo_items.todo.task_pending" },
							{ "gtd", "core.norg.qol.todo_items.todo.task_done" },
							{ "gth", "core.norg.qol.todo_items.todo.task_on_hold" },
							{ "gtc", "core.norg.qol.todo_items.todo.task_cancelled" },
							{ "gtr", "core.norg.qol.todo_items.todo.task_recurring" },
							{ "gti", "core.norg.qol.todo_items.todo.task_important" },
							{
								"<C-Space>",
								"core.norg.qol.todo_items.todo.task_cycle",
							},

							{ "<CR>", "core.norg.esupports.hop.hop-link" },
							{ "<M-CR>", "core.norg.esupports.hop.hop-link", "vsplit" },

							{ "<M-k>", "core.norg.manoeuvre.item_up" },
							{ "<M-j>", "core.norg.manoeuvre.item_down" },

							{
								"<neorg_leader>l",
								"core.integrations.telescope.insert_link",
							},
						},
					}, {
						silent = true,
						noremap = true,
					})

					-- Map the below keys on gtd displays
					keybinds.map_event_to_mode("gtd-displays", {
						n = {
							{ "<CR>", "core.gtd.ui.goto_task" },

							-- Keys for closing the current display
							{ "q", "core.gtd.ui.close" },
							{ "<Esc>", "core.gtd.ui.close" },

							{ "e", "core.gtd.ui.edit_task" },
							{ "<Tab>", "core.gtd.ui.details" },
						},
					}, {
						silent = true,
						noremap = true,
						nowait = true,
					})

					keybinds.map("norg", "n", "<leader>tv", "<cmd>Neorg gdt views<CR>")
				end,
			},
		},
	},
})

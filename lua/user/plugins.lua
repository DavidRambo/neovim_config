vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

packer.init({
	display = {
		open_fn = require("packer.util").float,
	},
})

return require("packer").startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- colorschemes
	use("navarasu/onedark.nvim")
	use({
		"NTBBloodbath/doom-one.nvim",
		setup = function()
			vim.g.doom_one_cursor_coloring = false
			vim.g.doom_one_terminal_colors = true
			vim.g.doom_one_italic_comments = true
			vim.g.doom_one_enable_treesitter = true
			vim.g.doom_one_diagnostics_text_color = false
			vim.g.doom_one_transparent_background = false
			-- Plugins integration
			vim.g.doom_one_plugin_neorg = true
			vim.g.doom_one_plugin_barbar = false
			vim.g.doom_one_plugin_telescope = true
			vim.g.doom_one_plugin_neogit = false
			vim.g.doom_one_plugin_nvim_tree = true
			vim.g.doom_one_plugin_dashboard = true
			vim.g.doom_one_plugin_startify = false
			vim.g.doom_one_plugin_whichkey = true
			vim.g.doom_one_plugin_indent_blankline = false
			vim.g.doom_one_plugin_vim_illuminate = true
			vim.g.doom_one_plugin_lspsaga = true
		end,
		-- config = function()
		-- 	vim.cmd.colorscheme("doom-one")
		-- end,
	})

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- lualine modeline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- NeoVim Tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- TreeSitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- fuzzy finder written in lua
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Telescope file browser
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Surround
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- Mark indentations
	use("lukas-reineke/indent-blankline.nvim")

	-- gc(c) to comment
	use("numToStr/Comment.nvim")

	-- gotta go fast
	-- use("phaazon/hop.nvim")
	use("ggandor/leap.nvim")
	use("fedepujol/move.nvim")
	-- tab out of those pairs!
	use("abecodes/tabout.nvim")

	-- LSP Install and Configuration
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		-- "mhartington/formatter.nvim",
	})

	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- improved UI
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("onsails/lspkind.nvim")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("folke/zen-mode.nvim")

	-- Completion
	use({
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		-- "hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		-- luasnip
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	})

	-- Like magit
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	-- git in the gutter
	use("lewis6991/gitsigns.nvim")

	-- which-key for that emacs-feel guide
	use("folke/which-key.nvim")

	-- org-mode syntax highlighting
	use("axvr/org.vim")

	-- Neorg
	use({
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers",
	})
end)

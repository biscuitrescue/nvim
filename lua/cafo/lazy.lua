local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- nav/editing
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	"numToStr/Comment.nvim",

	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- git
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"esmuellert/codediff.nvim", -- optional
			"m00qek/baleia.nvim",
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
	"nvim-lua/plenary.nvim",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	-- search
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{
		"notjedi/nvim-rooter.lua",
		config = function()
			require("nvim-rooter").setup()
		end,
	},
	-- ORG
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})

			-- Experimental LSP support
			vim.lsp.enable("org")
		end,
	},
	-- leetcode
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {},
	},

	-- lsp
	{ "neovim/nvim-lspconfig" },
	{
		"romus204/referencer.nvim",
		config = function()
			require("referencer").setup()
		end,
	},
	{
		"bassamsdata/namu.nvim",
		opts = {
			global = {},
			namu_symbols = { -- Specific Module options
				options = {},
			},
		},
		vim.keymap.set("n", "<leader>ss", ":Namu symbols<cr>", {
			desc = "Jump to LSP symbol",
			silent = true,
		}),
		vim.keymap.set("n", "<leader>sw", ":Namu workspace<cr>", {
			desc = "LSP Symbols - Workspace",
			silent = true,
		}),
	},
	-- completion
	{
		"saghen/blink.cmp",
		dependencies = {
			"saghen/blink.lib",
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
			completion = { documentation = { auto_show = false } },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "rust" },
		},
	},

	-- mini
	{
		"nvim-mini/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({
				custom_surroundings = {
					-- Remove space inside () [] {}
					["("] = { output = { left = "(", right = ")" } },
					["["] = { output = { left = "[", right = "]" } },
					["{"] = { output = { left = "{", right = "}" } },
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- UI
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{ "nvim-mini/mini.statusline", version = false, lazy = false },
	{ "nvim-mini/mini.cursorword", version = false, lazy = false },
	{ "nvim-mini/mini.hipatterns", version = false, lazy = false },
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
})

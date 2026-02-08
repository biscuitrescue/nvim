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
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	"numToStr/FTerm.nvim",
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
		branch = "main",
		build = ":TSUpdate",
	},
	-- git
	"tpope/vim-fugitive",
	"nvim-lua/plenary.nvim",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-mini/mini.icons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostics disable: missing-fields
		opts = {},
		---@diagnostics enable: missing-fields
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
		vim.keymap.set("n", "<leader>xx", ":Namu diagnostics workspace<cr>", {
			desc = "LSP Symbols - Workspace",
			silent = true,
		}),
		vim.keymap.set("n", "<leader>xX", ":Namu diagnostics buffers<cr>", {
			desc = "LSP Symbols - Workspace",
			silent = true,
		}),
		vim.keymap.set("n", "<leader>sw", ":Namu workspace<cr>", {
			desc = "LSP Symbols - Workspace",
			silent = true,
		}),
	},
	{
		"otavioschwanck/arrow.nvim",
		dependencies = {
			{ "nvim-mini/mini.icons" },
		},
		opts = {
			show_icons = true,
			leader_key = ",", -- Recommended to be a single key
			buffer_leader_key = "m", -- Per Buffer Mappings
		},
	},

	{
		"notjedi/nvim-rooter.lua",
		config = function()
			require("nvim-rooter").setup()
		end,
	},
	-- LSP
	{
		"jinzhongjia/LspUI.nvim",
		branch = "main",
		config = function()
			require("LspUI").setup({})
		end,
	},

	{ "neovim/nvim-lspconfig" },
	{
		"saghen/blink.cmp",
		lazy = false,
		priority = 1000,
		build = "cargo build --release",
	},
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
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	},

	-- UI
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		config = function()
			require("lualine").setup()
		end,
	},
})

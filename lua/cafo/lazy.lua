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
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	-- SESSIONS
	{
		"gennaro-tedesco/nvim-possession",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		config = true,
		keys = {
			{
				"<leader>sl",
				function()
					require("nvim-possession").list()
				end,
				desc = "📌list sessions",
			},
			{
				"<leader>sn",
				function()
					require("nvim-possession").new()
				end,
				desc = "📌create new session",
			},
			{
				"<leader>su",
				function()
					require("nvim-possession").update()
				end,
				desc = "📌update current session",
			},
			{
				"<leader>sd",
				function()
					require("nvim-possession").delete()
				end,
				desc = "📌delete selected session",
			},
		},
	},
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
	{
		"mbbill/undotree",
		lazy = true,
		cmd = "UndotreeToggle",
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

	"norcalli/nvim-colorizer.lua",
	{ "nvim-mini/mini.pairs", version = false },
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

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{
		"saghen/blink.cmp",
		lazy = false, -- Force it to load immediately
		priority = 1000, -- Make sure it's before LSP
		build = "cargo build --release",
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		config = function()
			require("render-markdown").setup({
				html = { enabled = false },
				latex = { enabled = true },
				completions = {
					blink = { enabled = true },
					lsp = { enabled = true },
				},
			})
		end,
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
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	},

	-- UI

	{ "nvim-mini/mini.statusline", version = false },
	{ "nvim-mini/mini.animate", version = false },
	{ "nvim-mini/mini.indentscope", version = false },
	{ "folke/zen-mode.nvim", opts = {} },
	{ "nvim-mini/mini.cursorword", version = false },
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-mini/mini.icons" },
		config = function()
			local startify = require("alpha.themes.startify")
			startify.file_icons.provider = "mini"
			require("alpha").setup(startify.config)
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
	},
})

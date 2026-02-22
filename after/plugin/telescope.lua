local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
require("telescope").setup({
	defaults = themes.get_ivy({}),
	pickers = {
		-- find_files = { theme = "ivy" },
		-- live_grep = { theme = "ivy" },
		-- buffers = { theme = "ivy" },
		-- diagnostics = { theme = "ivy" },
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})
vim.keymap.set("n", "<leader>.", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Telescope marks" })
vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Telescope jumplist" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope LSP References" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope LSP Diagnostics" })
vim.keymap.set("n", "<leader>ft", builtin.lsp_definitions, { desc = "Telescope LSP Definitions" })
vim.keymap.set("n", "<leader>ff", builtin.lsp_type_definitions, { desc = "Telescope LSP Definitions" })
vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "Telescope LSP Impls" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope Git Commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Telescope Git Buffer Commits" })
vim.keymap.set("n", "<leader>gm", builtin.git_branches, { desc = "Telescope Git Branches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope Git Status" })
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Telescope Treesitter" })
vim.keymap.set("n", "<leader>fp", builtin.planets, { desc = "Telescope Treesitter" })
require("telescope").load_extension("fzf")

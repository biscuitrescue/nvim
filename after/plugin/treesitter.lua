require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"hyprlang",
		"c",
		"cpp",
		"lua",
		"rust",
		"python",
		"gitignore",
		"vim",
		"query",
		"markdown",
		"markdown_inline",
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	matchup = { enable = true },
})

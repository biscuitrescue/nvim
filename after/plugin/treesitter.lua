require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {"bash", "hyprlang", "c", "cpp", "lua", "rust", "python", "vim", "query", "markdown", "markdown_inline" },

	sync_install = true,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
    matchup = { enable = true }
}

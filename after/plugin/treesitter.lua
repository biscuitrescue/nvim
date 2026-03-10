local treesit = require("nvim-treesitter")
treesit.setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})
treesit.install({
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
	"zig",
})

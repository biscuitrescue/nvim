require("neomodern").setup({
	-- Can be one of: 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'
	theme = "roseprime",

	variant = "dark",

	-- Use an alternate, darker bg
	alt_bg = false,
	colored_docstrings = true,
	dark_gutter = false,
	favor_treesitter_hl = false,
	plain_float = false,
	term_colors = true,
	toggle_variant_key = nil,
	transparent = true,

	diagnostics = {
		darker = true, -- Darker colors for diagnostic
		undercurl = true, -- Use undercurl for diagnostics
		background = true, -- Use background color for virtual text
	},
	code_style = {
		comments = "italic",
		conditionals = "none",
		functions = "none",
		keywords = "italic",
		headings = "bold", -- Markdown headings
		operators = "none",
		keyword_return = "italic",
		strings = "none",
		variables = "none",
	},

	plugin = {
		lualine = {
			bold = true,
			plain = false,
		},
		cmp = { -- works for nvim.cmp and blink.nvim
			plain = false,
			reverse = false,
		},
	},

	colors = {},
	-- Override highlight groups
	highlights = {},
})
require("neomodern").load()

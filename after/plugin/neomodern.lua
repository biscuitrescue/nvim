require("neomodern").setup({
	bg = "transparent",

	theme = "roseprime", -- 'moon' | 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'

	gutter = {
		cursorline = false, -- highlight the cursorline in the gutter
		dark = false, -- highlight gutter darker than the Normal bg
	},

	diagnostics = {
		darker = true, -- use darker colors for diagnostics
		undercurl = true, -- use undercurl for diagnostics
		background = true, -- use a background color for diagnostics
	},

	overrides = {
		default = {},
		hlgroups = {},
	},
})
require("neomodern").load()

require("kanagawa").setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = {
		palette = {},
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	overrides = function(colors)
		return {
			BlinkCmpMenu = { bg = colors.palette.dragonBlack4 },
			BlinkCmpScrollBarGutter = { bg = colors.palette.dragonAsh },
			BlinkCmpScrollBarThumb = { bg = colors.palette.dragonYellow },
			BlinkCmpMenuSelection = { bg = colors.palette.dragonBlack0, fg = colors.palette.dragonAsh },
			Visual = { bg = colors.palette.dragonBlack5 },
		}
	end,
	theme = "dragon",
	background = {
		dark = "dragon",
		light = "lotus",
	},
})

vim.cmd("colorscheme kanagawa")

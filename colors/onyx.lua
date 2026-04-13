vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "onyx"

local set = vim.api.nvim_set_hl

local c = {
	bg = "#0c0c0c",
	fg = "#bdc4a7",
	black = "#0c0c0c",
	grey = "#393D3F",
	red = "#F02D3A",
	red_alt = "#F45B69",
	green = "#9FC490",
	green_alt = "#70AE6E",
	yellow = "#F9DF74",
	yellow_alt = "#E6C79C",
	blue = "#7e8dba",
	blue_alt = "#7180ac",
	magenta = "#987284",
	magenta_alt = "#9B5094",
	cyan = "#99EDCC",
	cyan_alt = "#75BBA7",
	white = "#D5C5C8",
	white_alt = "#F7F0F5",
	sel_bg = "#293334",
	sel_fg = "#cecece",
	cursor = "#da627d",
	url = "#FFCAD4",
	orange = "#F49D6E",
}

-- Core UI
set(0, "Normal", { fg = c.fg, bg = c.bg })
set(0, "Cursor", { fg = c.bg, bg = c.cursor })
set(0, "Visual", { fg = c.sel_fg, bg = c.sel_bg })
set(0, "CursorLine", { bg = c.sel_bg })
set(0, "LineNr", { fg = c.grey })
set(0, "CursorLineNr", { fg = c.blue, bold = true })

-- Statusline
set(0, "StatusLine", { fg = c.fg, bg = c.sel_bg })
set(0, "StatusLineNC", { fg = c.grey, bg = c.bg })

-- Search / matches
set(0, "Search", { fg = c.bg, bg = c.yellow })
set(0, "IncSearch", { fg = c.bg, bg = c.yellow })

-- Popup menu
set(0, "Pmenu", { fg = c.fg, bg = c.bg })
set(0, "PmenuSel", { fg = c.white, bg = c.sel_bg })

-- Syntax (from font-lock mapping)
set(0, "Comment", { fg = c.orange, italic = true })
set(0, "Keyword", { fg = c.fg, bold = true })
set(0, "Function", { fg = c.blue })
set(0, "String", { fg = c.green_alt })
set(0, "Type", { fg = c.yellow })
set(0, "Constant", { fg = c.cyan })
set(0, "Identifier", { fg = c.yellow_alt })
set(0, "Error", { fg = c.red, bold = true })

-- Treesitter (IMPORTANT)
set(0, "@comment", { fg = c.orange, italic = true })
set(0, "@keyword", { fg = c.fg, bold = true })
set(0, "@function", { fg = c.blue })
set(0, "@string", { fg = c.green_alt })
set(0, "@type", { fg = c.yellow })
set(0, "@variable", { fg = c.yellow_alt })
set(0, "@constant", { fg = c.cyan })

-- Diagnostics (LSP)
set(0, "DiagnosticError", { fg = c.red })
set(0, "DiagnosticWarn", { fg = c.yellow })
set(0, "DiagnosticInfo", { fg = c.blue })
set(0, "DiagnosticHint", { fg = c.cyan })

-- Git (magit → gitsigns)
set(0, "DiffAdd", { fg = c.green, bg = "#0f1a0f" })
set(0, "DiffChange", { fg = c.yellow })
set(0, "DiffDelete", { fg = c.red, bg = "#1a0f0f" })

-- Directory (dired → netrw/neo-tree)
set(0, "Directory", { fg = c.blue, bold = true })

-- Links
set(0, "Underlined", { fg = c.url, underline = true })

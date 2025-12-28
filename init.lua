local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

o.winborder = "rounded"
opt.shortmess = opt.shortmess + "at"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.encoding = "UTF-8"
opt.ignorecase = true
opt.smartcase = true
opt.nu = true
opt.rnu = true
o.mouse = "a"
opt.clipboard = "unnamedplus"
opt.shiftwidth = 2
opt.tabstop = 4
opt.scrolloff = 4
opt.confirm = true
opt.autoindent = true
opt.expandtab = true
opt.showmode = false
-- o.statusline = " | %{%v:lua.statusline_mode()%}"
-- 	.. "| %P | %l:%c%V "
-- 	.. "%=%h %m%r"
-- 	.. "%{%v:lua.statusline_diagnostics()%} | %t | "
opt.linebreak = true
opt.termguicolors = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
opt.cursorline = false
opt.cursorcolumn = false
opt.background = "dark"
opt.conceallevel = 2
opt.laststatus = 3

vim.diagnostic.config({
	virtual_text = {
		prefix = "", -- remove weird leading symbols
		spacing = 1,
	},
	float = false,
	signs = true,
	underline = true,
	update_in_insert = false,
})

vim.filetype.add({
	extension = { rasi = "rasi" },
	pattern = {
		[".*/waybar/config"] = "jsonc",
		[".*/mako/config"] = "dosini",
		[".*/kitty/*.conf"] = "bash",
		[".*/hypr/.*%.conf"] = "hyprlang",
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.cmd([[silent! %s/\s\+$//e]])
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.api.nvim_exec("normal! g'\"", false)
		end
	end,
})

opt.completeopt = { "menu", "menuone", "noselect" }

-- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ffffff", bg = "#444444", bold = true })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NonText", { bg = "none", fg = "#999999" })
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#e5b566" })

require("cafo.remap")
require("cafo.lazy")
require("cafo.langs")

vim.cmd.colorscheme("bamboo")

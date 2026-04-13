local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

require("vim._core.ui2").enable()

function _G.statusline_mode()
	local mode_map = {
		n = "N",
		i = "I",
		v = "V",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "C",
		R = "R",
		t = "T",
	}
	return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
end

function _G.statusline_git()
	local branch = vim.b.gitsigns_head
	if branch then
		return "%#Function#  " .. branch .. " %#StatusLine#"
	end
	return ""
end

function _G.statusline_diagnostics()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	return string.format(" E:%d W:%d ", errors, warns)
end

if vim.g.neovide then
	vim.o.guifont = "Monaspace Argon NF:h13.5"
end

o.statusline = " |%#Statement# %{%v:lua.statusline_mode()%} "
	.. "%#StatusLine#| "
	.. "%#Identifier#%t "
	.. "%#StatusLine#|"
	.. "%#Constant#%{%v:lua.statusline_diagnostics()%}"
	.. "%#StatusLine#|"
	.. "%#Function#%{%v:lua.statusline_git()%} "
	.. "%#StatusLine#"
	.. "%="
	.. "%#PreProc#%h%m%r "
	.. "%#StatusLine#| "
	.. "%#Type#%l:%c%V "
	.. "%#StatusLine#| "
	.. "%#Identifier#%P "
	.. "%#StatusLine#| "

o.winborder = "none"
opt.shortmess = opt.shortmess + "atI"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.encoding = "UTF-8"
opt.ignorecase = true
opt.smartcase = true
opt.nu = true
opt.rnu = false
o.mouse = "a"
opt.clipboard = "unnamedplus"
opt.shiftwidth = 4
opt.tabstop = 4
opt.scrolloff = 4
opt.confirm = true
opt.autoindent = true
opt.expandtab = true
opt.showmode = false
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

local sev = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = {
		prefix = "",
		spacing = 1,
	},
	float = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			[sev.ERROR] = "E",
			[sev.WARN] = "W",
			[sev.INFO] = "I",
			[sev.HINT] = "H",
		},
	},
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

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.api.nvim_exec("normal! g'\"", false)
		end
	end,
})

opt.completeopt = { "menu", "menuone", "noselect" }

require("cafo.remap")
require("cafo.lazy")
require("cafo.langs")
vim.cmd.colorscheme("onyx")
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

local opt = vim.opt
local o = vim.o
local g = vim.g
local mode_map = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	[""] = "V-BLOCK",
	c = "COMMAND",
	R = "REPLACE",
	t = "TERMINAL",
}

_G.statusline_mode = function()
	local m = vim.fn.mode()
	return (mode_map[m] or m) .. " "
end

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
opt.laststatus = 3
opt.confirm = true
opt.autoindent = true
opt.expandtab = true
opt.showmode = false
o.statusline = " |  %{%v:lua.statusline_mode()%}" .. " | %P " .. "| %l:%c%V " .. "%=%h %m%r |" .. " %t | "
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

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.api.nvim_exec("normal! g'\"", false)
		end
	end,
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

-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = function()
-- 		local opts = {
-- 			focusable = false,
-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
-- 			border = "rounded",
-- 			source = "always",
-- 			prefix = "",
-- 			scope = "line",
-- 		}
--
-- 		if #vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 }) > 0 then
-- 			vim.diagnostic.open_float(nil, opts)
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if #vim.fn.argv() == 0 then
			vim.cmd("cd " .. vim.fn.getcwd())
			vim.schedule(function()
				require("oil").open()
			end)
		end
	end,
})

opt.completeopt = { "menu", "menuone", "noselect" }

vim.cmd.colorscheme("habamax")

vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ffffff", bg = "#444444", bold = true })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#e5b566" })

require("cafo.remap")
require("cafo.lazy")
require("cafo.langs")

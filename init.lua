local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

opt.shortmess = vim.opt.shortmess + "atI"
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
o.statusline = o.statusline .. "%#warningmsg#" .. "%*"
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
opt.cursorline = true
opt.cursorcolumn = false
opt.background = "dark"
opt.conceallevel = 2

-- Neovide
if vim.g.neovide then
	vim.o.guifont = "Fira Code:h12" -- text below applies for VimScript
	opt.linespace = 0
	g.neovide_scale_factor = 1.0
	g.neovide_padding_top = 1
	g.neovide_padding_bottom = 1
	g.neovide_padding_right = 1
	g.neovide_padding_left = 1
	g.neovide_cursor_vfx_particle_density = 10.0
	g.neovide_cursor_vfx_mode = "railgun"
	g.neovide_opacity = 1
	g.neovide_normal_opacity = 1
end

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

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = "",
			scope = "line",
		}

		if #vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 }) > 0 then
			vim.diagnostic.open_float(nil, opts)
		end
	end,
})

local servers = { "lua", "python" }

for _, server in ipairs(servers) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = server,
		callback = function()
			vim.bo.expandtab = true -- Use spaces not tabs
			vim.bo.shiftwidth = 4 -- Indent width
			vim.bo.tabstop = 4 -- Tabs appear as 4 spaces
			vim.bo.softtabstop = 4
			vim.bo.autoindent = true
			vim.bo.smartindent = false -- Let Black handle indentation rules
			vim.keymap.set("n", "=", function()
				vim.lsp.buf.format({ async = true })
			end, { buffer = true })
		end,
	})
end

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

require("cafo.remap")
require("cafo.lazy")

-- vim.cmd.colorscheme("kanagawa-paper-ink")

local opt = vim.opt
local o = vim.o
local g = vim.g

opt.signcolumn = 'yes'
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
o.statusline = o.statusline .. '%#warningmsg#' .. '%*'
opt.linebreak = true
opt.termguicolors = true
-- g.term = "screen-256color"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
opt.cursorline = true
opt.cursorcolumn = false
opt.background = 'dark'
opt.conceallevel = 2


vim.api.nvim_set_hl(0, 'Comment', { italic=true })

-- vim.cmd("hi Comment guifg=darkgrey")
-- vim.cmd("IndentLinesEnable")
-- vim.cmd("hi NvimTreeNormal guibg=NONE")
-- vim.api.nvim_set_hl(0, 'Comment', { italic=true })

g.mapleader = " "

vim.api.nvim_create_autocmd({"BufReadPost"}, {
  pattern = {"*"},
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.api.nvim_exec("normal! g'\"", false)
    end
  end
})

if vim.g.neovide then
  -- vim.o.guifont = "operator mono:h11"
  vim.o.guifont = "jetbrainsmono nerd font:h11"
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_padding_top = 1
  vim.g.neovide_padding_bottom = 1
  vim.g.neovide_padding_right = 1
  vim.g.neovide_padding_left = 1

  vim.g.neovide_cursor_vfx_particle_density = 10.0
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_opacity = 0.9
  vim.g.neovide_normal_opacity = 0.9
end

vim.filetype.add {
  extension = { rasi = 'rasi' },
  pattern = {
    ['.*/waybar/config'] = 'jsonc',
    ['.*/mako/config'] = 'dosini',
    ['.*/kitty/*.conf'] = 'bash',
    ['.*/hypr/.*%.conf'] = 'hyprlang',
  },
}

require("cafo.remap")
require("cafo.lazy")
require 'colorizer'.setup()

vim.cmd.colorscheme("kanagawa-dragon")
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if  not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy=false,
  },
  -- SESSIONS
  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = true,
    keys = {
      { "<leader>sl", function() require("nvim-possession").list() end, desc = "📌list sessions", },
      { "<leader>sn", function() require("nvim-possession").new() end, desc = "📌create new session", },
      { "<leader>su", function() require("nvim-possession").update() end, desc = "📌update current session", },
      { "<leader>sd", function() require("nvim-possession").delete() end, desc = "📌delete selected session"},
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  {
    'mbbill/undotree',
    lazy = true,
    cmd = 'UndotreeToggle'
  },
  -- git
  'tpope/vim-fugitive',
  'nvim-lua/plenary.nvim',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons'
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {'norcalli/nvim-colorizer.lua'},
  {
    'notjedi/nvim-rooter.lua',
    config = function()
      require'nvim-rooter'.setup()
    end
  },
  -- LSP
  {
    "jinzhongjia/LspUI.nvim",
    branch = "main",
    config = function()
      require("LspUI").setup({
        })
      end
    },

    -- LSP
    {"neovim/nvim-lspconfig"},
    {
      "saghen/blink.cmp",
      lazy = false, -- Force it to load immediately
      priority = 1000, -- Make sure it's before LSP
      build = 'cargo build --release',
    },

    {
      "numToStr/FTerm.nvim",
      config = function()
        require("FTerm").setup({
          border = 'double',
          dimensions  = {
            height = 0.9,
            width = 0.9,
          },
        })
      end
    },
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        -- "rcarriga/nvim-notify",
      }
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
      config = function ()
        require('render-markdown').setup({
          html = { enabled = false },
          latex = { enabled = true },
          completions = {
            blink = { enabled = true },
            lsp = { enabled = true }
          },
        })
      end
    },
    {
      'echasnovski/mini.surround',
      version = false,
      config = function()
        require('mini.surround').setup({
          custom_surroundings = {
            -- Remove space inside () [] {}
            ['('] = { output = { left = '(', right = ')' } },
            ['['] = { output = { left = '[', right = ']' } },
            ['{'] = { output = { left = '{', right = '}' } },
          },
        })
      end
    },
    {
      "folke/trouble.nvim",
      dependencies = { 'echasnovski/mini.icons' },
      opts = {
      },
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
      }
    },
    {
      "nvimtools/none-ls.nvim",
      dependencies = {
        "nvimtools/none-ls-extras.nvim",
      },
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("persistence").setup()
      end,
    },
    -- UI
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    },
    { "rebelot/kanagawa.nvim", lazy=true },
    {
      "cdmill/neomodern.nvim",
      lazy = false,
      priority = 1000,
    },
  })

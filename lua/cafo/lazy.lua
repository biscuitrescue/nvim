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
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        }
      }
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
      { "<C-n>", function() Snacks.explorer() end, desc = "File Explorer" },
      -- find
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>.", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<leader>,", function() Snacks.picker.recent({filter = {cwd = true}}) end, desc = "Recent" },
      -- git
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      -- Grep
      { "<leader>tb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>tB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>tg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>tw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      -- search
      { '<leader>t"', function() Snacks.picker.registers() end, desc = "Registers" },
      { '<leader>t/', function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>ta", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>tb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>tc", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>tC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>td", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>tD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>th", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>tH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>ti", function() Snacks.picker.icons() end, desc = "Icons" },
      { "<leader>tj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>tk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>tl", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>tm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>tM", function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<leader>tp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>tq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>tR", function() Snacks.picker.resume() end, desc = "Resume" },
      { "<leader>tu", function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ts", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>tS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- Other
      { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<leader>b.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      {
        "<leader>N",
        desc = "Neovim News",
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end,
      }
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
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
  "sindrets/diffview.nvim",

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

  -- {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
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
      -- require("LspUI").setup({
        --   -- config options go here
        -- })
      end
    },

    -- LSP
    {
      "neovim/nvim-lspconfig",
    },

    -- Blink.cmp for completions
    {
      "saghen/blink.cmp",
      lazy = false, -- Force it to load immediately
      priority = 1000, -- Make sure it's before LSP
      build = 'cargo build --release',
    },

    -- {
    --   "ray-x/go.nvim",
    --   dependencies = {  -- optional packages
    --     "ray-x/guihua.lua",
    --     "neovim/nvim-lspconfig",
    --     "nvim-treesitter/nvim-treesitter",
    --   },
    --   config = function()
    --     require("go").setup()
    --   end,
    --   event = {"CmdlineEnter"},
    --   ft = {"go", 'gomod'},
    --   build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    -- },

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
      "toppair/peek.nvim",
      event = { "VeryLazy" },
      build = "deno task --quiet build",
      config = function()
        require("peek").setup({
          app = { 'brave', '--new-window' },

        })
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
      end,
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
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
        require('mini.surround').setup()
      end
    },

    {
      "folke/trouble.nvim",
      dependencies = { "kyazdani42/nvim-web-devicons" },
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
    {
      "olimorris/onedarkpro.nvim",
      lazy=true,
    },
    { "catppuccin/nvim", name = "catppuccin", lazy = true },
    {"rebelot/kanagawa.nvim", lazy=true},
    {
      "thesimonho/kanagawa-paper.nvim",
      lazy = true,
      priority = 1000,
      opts = {},
    },
    -- Using lazy.nvim
    {
      "cdmill/neomodern.nvim",
      lazy = false,
      priority = 1000,
    },
  })

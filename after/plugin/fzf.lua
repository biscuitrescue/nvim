local fzf = require("fzf-lua")

fzf.setup({
  "hide",
  "resume",
  winopts = {
      split = "belowright new",
  },
  preview = {
      scrollbar = "border"
  },
  fzf_colors = true,
  -- your other settings here 
})

fzf.register_ui_select()

vim.keymap.set("n", "<leader>.", fzf.files, { desc = "FzfLua find files" })
vim.keymap.set("n", "<leader>rl", fzf.live_grep, { desc = "FzfLua grep" })
vim.keymap.set("n", "<leader>rg", fzf.grep, { desc = "FzfLua grep" })
vim.keymap.set("n", "<leader>rc", fzf.grep_cword , { desc = "FzfLua grep current word" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "FzfLua buffers" })
vim.keymap.set("n", "<leader>fz", fzf.zoxide, { desc = "FzfLua zoxide" })
vim.keymap.set("n", "<leader>lca", fzf.lsp_code_actions, { desc = "FzfLua LSP References" })
vim.keymap.set("n", "<leader>lr", fzf.lsp_references, { desc = "FzfLua LSP References" })
vim.keymap.set("n", "<leader>ldd", fzf.diagnostics_document, { desc = "FzfLua LSP Diagnostics" })
vim.keymap.set("n", "<leader>ldw", fzf.diagnostics_workspace, { desc = "FzfLua LSP Diagnostics" })
vim.keymap.set("n", "<leader>lt", fzf.lsp_definitions, { desc = "FzfLua LSP Definitions" })
vim.keymap.set("n", "<leader>lf", fzf.lsp_typedefs, { desc = "FzfLua LSP Definitions" })
vim.keymap.set("n", "<leader>li", fzf.lsp_implementations, { desc = "FzfLua LSP Impls" })
vim.keymap.set("n", "<leader>gc", fzf.git_commits, { desc = "FzfLua Git Commits" })
vim.keymap.set("n", "<leader>gb", fzf.git_bcommits, { desc = "FzfLua Git Buffer Commits" })
vim.keymap.set("n", "<leader>gm", fzf.git_branches, { desc = "FzfLua Git Branches" })
vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "FzfLua Git Status" })
vim.keymap.set("n", "<leader>gd", fzf.git_diff, { desc = "FzfLua Git Diff" })

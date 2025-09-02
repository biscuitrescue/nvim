local opts = { noremap = true, silent = true }

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }, opts)

vim.keymap.set("n", "<leader>so", function()
    vim.cmd("split | Oil ")
end, opts)

vim.keymap.set("n", "<leader>vo", function()
    vim.cmd("vsplit | Oil ")
end, opts)

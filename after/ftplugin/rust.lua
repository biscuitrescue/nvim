local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
	vim.lsp.buf.code_action() -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "<leader>b", ":Cargo build<CR>")
vim.keymap.set("n", "<leader>c", ":Cargo check<CR>")

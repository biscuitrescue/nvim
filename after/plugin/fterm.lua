require("FTerm").setup({
	border = "rounded",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})

-- Example keybindings
vim.keymap.set("n", "<C- >", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<C- >", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

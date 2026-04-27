local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	local map = vim.keymap.set

	-- LSP keymaps
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map("n", "<leader>rn", vim.lsp.buf.rename, opts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	map("n", "[d", vim.diagnostic.goto_prev, opts)
	map("n", "]d", vim.diagnostic.goto_next, opts)
end

-- in lspconfig.lua
local servers = { "rust_analyzer", "clangd", "pylsp", "zls", "nil_ls" }

for _, server in ipairs(servers) do
	vim.lsp.config[server] = {
		capabilities = capabilities,
		on_attach = on_attach,
	}
	vim.lsp.enable(server)
end

-- You can keep custom settings for specific servers, like lua_ls
vim.lsp.config["lua_ls"] = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}
vim.lsp.enable("lua_ls")

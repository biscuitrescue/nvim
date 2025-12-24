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

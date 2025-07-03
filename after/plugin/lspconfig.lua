-- 🌟 LSP Setup using Neovim 0.10+ API
local capabilities = require("blink.cmp").get_lsp_capabilities()

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  local keymap = vim.keymap.set

  -- LSP keymaps
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap("n", "]d", vim.diagnostic.goto_next, opts)
end

-- 🦀 Rust
vim.lsp.config["rust_analyzer"] = {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
}
vim.lsp.enable("rust_analyzer")

-- 🛠 C/C++
vim.lsp.config["clangd"] = {
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.lsp.enable("clangd")

-- 🐍 Python
vim.lsp.config["pyright"] = {
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.lsp.enable("pyright")

-- ⚡ Zig
vim.lsp.config["zls"] = {
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.lsp.enable("zls")

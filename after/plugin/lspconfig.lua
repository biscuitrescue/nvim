require("blink.cmp").setup({
  completion = { list = { selection = { preselect = false }}},
  keymap = {
    preset = "enter",
    -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    -- ['<C-e>'] = { 'hide', 'fallback' },
    -- ['<CR>'] = { 'accept', 'fallback' },
    --
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    --
    -- ['<Up>'] = { 'select_prev', 'fallback' },
    -- ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'snippet_forward', 'fallback_to_mappings' },
    ['<C-n>'] = { 'snippet_backward', 'fallback_to_mappings' },
    --
    -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    -- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    --
    -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
  },
  sources = { default = { "lsp", "buffer", "path", "snippets" } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- 🌟 Common on_attach for keymaps
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

-- 🦀 Rust
vim.lsp.config["rust_analyzer"] = {
  capabilities = capabilities,
  on_attach = on_attach,
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

-- 🌙 Lua
vim.lsp.config["lua_ls"] = {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }, -- suppress "vim" undefined warnings
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}
vim.lsp.enable("lua_ls")

-- ❄️ Nix
vim.lsp.config["nil_ls"] = {
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.lsp.enable("nil_ls")

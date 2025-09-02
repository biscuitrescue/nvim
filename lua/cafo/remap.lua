local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-- LSP
set({ "n", "v", "x" }, "<leader>tf", function()
    vim.diagnostic.open_float()
end, opts)
set("n", "gd", function()
    vim.lsp.buf.definition()
end, opts)
set("n", "<leader>lf", function()
    vim.lsp.buf.format()
end, opts)

-- Navigation to 0 and $
set({ "n", "v", "x" }, "<A-w>", "^")
set({ "n", "v", "x" }, "<A-e>", "$")

-- Zenmode
set({ "n", "v", "x" }, "<leader>z", "<cmd>ZenMode<CR>")
-- Nav
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- QOL
set("x", "<leader>p", [["_dP]])
set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
set("n", "<leader>c", "<cmd>!clang %<CR>", { silent = true })
set("n", "<leader>C", "<cmd>!clang++ %<CR>", { silent = true })
set("n", "<leader>fs", ":w<CR>")
set("n", ";", ":")
set("n", "<leader>w", "<C-w>")

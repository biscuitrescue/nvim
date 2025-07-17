local set = vim.keymap.set
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Lsp float show 
set({"n", "v", "x", "i"}, "<leader>tf", function() vim.diagnostic.open_float() end, opts)
-- Modes for ipad when ssh
set({"n", "v", "x", "i"}, "<C-`>", "<esc>")

-- Move to previous/next
set({"n", "v", "x", "i"}, "<A-w>", "^")
set({"n", "v", "x", "i"}, "<A-e>", "$")
-- map('x', '<A-w>', '^', opts)
-- map('x', '<A-e>', '$', opts)
set({"n", "v", "x", "i"}, '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
set({"n", "v", "x", "i"}, '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
set({"n", "v", "x", "i"}, '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
set({"n", "v", "x", "i"}, '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
set({"n", "v", "x", "i"}, '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
set({"n", "v", "x", "i"}, '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
set({"n", "v", "x", "i"}, '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
set({"n", "v", "x", "i"}, '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
set({"n", "v", "x", "i"}, '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
set({"n", "v", "x", "i"}, '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
set({"n", "v", "x", "i"}, '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
set({"n", "v", "x", "i"}, '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
set({"n", "v", "x", "i"}, '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
set({"n", "v", "x", "i"}, '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
set({"n", "v", "x", "i"}, '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
set({"n", "v", "x", "i"}, '<A-p>', '<Cmd>BufferPin<CR>', opts)

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<leader>go", ":DiffviewOpen<CR>")
set("n", "<leader>gc", ":DiffviewClose<CR>")
set("n", "gd", function() vim.lsp.buf.definition() end, opts)
set("n", "gd", function() vim.lsp.buf.definition() end, opts)
set("x", "<leader>p", [["_dP]])
set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
set("n", "<leader>c", "<cmd>!clang %<CR>", { silent = true })
set("n", "<leader>C", "<cmd>!clang++ %<CR>", { silent = true })
set("n", "<leader>fs", ":w<CR>")
set("n", "<leader>fr", ":so<CR>")
set("n", ";", ":")
set("n", "<leader>cd", ":cd ")
set("n", "<leader>wv", ":vs<CR>")
set("n", "<leader>w", "<C-w>")

set("n", "<leader>op", ":e ")

-- Buffer
--
--`
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

set('n', '<leader>ot', '<CMD>lua require("FTerm").toggle()<CR>')
set('t', '<leader>ot', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

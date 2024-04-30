local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("n", "\\", ":vsplit<cr>", opts)
keymap("n", "|", "<C-w>c", opts)
keymap("n", "O", "o<Esc>", opts)
keymap("n", "∆", ":m .+1<CR>==", opts)
keymap("n", "˚", ":m .-2<CR>==", opts)
keymap("n", "<C-j>", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "<C-k>", ":BufferLineCycleNext<cr>", opts)
keymap("n", "<leader>c", ":BufDel<cr>", opts)
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<cr>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<cr>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<cr>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<cr>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<cr>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<cr>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<cr>", opts)
keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<cr>", opts)
keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<cr>", opts)
keymap("n", "<leader>-1", ":BufferLineGoToBuffer -1<cr>", opts)
keymap("v", "∆", ":m '>+1<CR>gv=gv", opts)
keymap("v", "˚", ":m '<-2<CR>gv=gv", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', opts)
vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward)')

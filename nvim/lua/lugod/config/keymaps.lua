-- yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>Y", "\"+Y")

-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- reselect pasted text
vim.keymap.set("n", "gp", "`[v`]")

-- format entire document
vim.keymap.set("n", "gq%", "gggqG<C-o>")

-- delete word in insert mode
vim.keymap.set("i", "<C-BS>", "<C-W>")

-- change window focus
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- resize window
vim.keymap.set("n", "<C-A-h>", "<C-w><")
vim.keymap.set("n", "<C-A-j>", "<C-w>+")
vim.keymap.set("n", "<C-A-k>", "<C-w>-")
vim.keymap.set("n", "<C-A-l>", "<C-w>>")
vim.keymap.set("n", "<C-A-->", "<C-w>_")
vim.keymap.set("n", "<C-A-Bslash>", "<C-w>|")
vim.keymap.set("n", "<C-A-=>", "<C-w>=")

-- paste without replace
vim.keymap.set("x", "<leader>p", "\"_dP")

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

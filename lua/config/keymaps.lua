vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>t", "<CMD>Twilight<CR>")

vim.keymap.set("v", "J", "<CMD>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<CMD>m '<-2<CR>gv=gv")

vim.keymap.set("n", "<CR>", "o<Esc>")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "u", "<CMD>undo<CR>")
vim.keymap.set("n", "U", "<CMD>redo<CR>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("n", "<leader>x", "<CMD>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", "<CMD>so<CR>")

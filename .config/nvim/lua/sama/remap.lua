vim.g.mapleader = " "


vim.keymap.set("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>")

vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>split<cr>")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

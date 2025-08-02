vim.keymap.set("n", "gh", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "gj", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "gk", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "gl", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

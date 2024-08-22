-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps herei
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<C-g>", ":Git ")

vim.keymap.set("n", "J", "10j")
vim.keymap.set("n", "K", "10k")
vim.keymap.set("v", "J", "10j")
vim.keymap.set("v", "K", "10k")

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>y", '"+yy')

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

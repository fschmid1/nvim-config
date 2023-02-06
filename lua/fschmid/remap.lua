vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>") -- increment
vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement
vim.keymap.set("n", "<C-f>", ":lua vim.lsp.buf.format()") -- decrement

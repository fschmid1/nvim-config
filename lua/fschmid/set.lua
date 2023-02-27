local opt = vim.opt

opt.remap = true

opt.relativenumber = true
opt.number = true
opt.cursorline = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
-- opt.autoindent = true
opt.scrolloff = 8

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"


-- opt.clipboard:append("unnamedplus")
--
opt.iskeyword:append("-")

vim.g.user42 = "fschmid"
vim.g.mail42 = "fschmid@student.42heilbronn.de"

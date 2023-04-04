local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension("live_grep_args")

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })

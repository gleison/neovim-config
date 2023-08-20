-- Some remaps to faster find files and git files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})


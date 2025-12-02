-- Simple way to go back to netrw
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

-- Navigate between buffers
vim.keymap.set('n', '<leader>n', vim.cmd.bn)
vim.keymap.set('n', '<leader>p', vim.cmd.bp)
vim.keymap.set('n', '<leader>w', vim.cmd.bd)

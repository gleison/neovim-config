-- Simple way to go back to netrw
vim.keymap.set('n', '<leader>q', vim.cmd.Ex)

-- Navigate between buffers
vim.keymap.set('n', '<leader>n', vim.cmd.bn)
vim.keymap.set('n', '<leader>p', vim.cmd.bp)
vim.keymap.set('n', '<leader>w', vim.cmd.bd)

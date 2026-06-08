-- Access Netrw
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

-- Navigate between buffers
vim.keymap.set('n', '<leader>n', vim.cmd.bn)
vim.keymap.set('n', '<leader>p', vim.cmd.bp)

-- Close a buffer
vim.keymap.set('n', '<leader>q', vim.cmd.bd)

vim.keymap.set({ "n", "v" }, "<A-Up>", ":m .-2<CR>==", { desc = "Move Line Up" })
vim.keymap.set({ "n", "v" }, "<A-Down>", ":m .+1<CR>==", { desc = "Move Line Down" })

-- Clear highlight search with ESC
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

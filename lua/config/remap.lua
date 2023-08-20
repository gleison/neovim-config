-- Simple way to go back to netrw
-- vim.keymap.set('n', '<leader>q', vim.cmd.Ex)

-- Navigate between buffers
vim.keymap.set('n', '<leader>n', vim.cmd.bn)
vim.keymap.set('n', '<leader>p', vim.cmd.bp)

-- LSP remaps
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, {})
vim.keymap.set('n', '<leader>t', vim.lsp.buf.code_action, {})
vim.keymap.set('v', '<leader>t', vim.lsp.buf.code_action, {})

-- Telescope remaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
vim.keymap.set('n', '<leader>O', builtin.lsp_document_symbols, {})


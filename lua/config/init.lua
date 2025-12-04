-- Initial configurations
require('config.remap')
require('config.set')

vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
    { src = 'https://github.com/neovim/nvim-lspconfig', name = 'lspconfig'},
    { src = 'https://github.com/mason-org/mason.nvim', name = 'mason'},
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim', name = 'mason-lspconfig'}
})

vim.cmd('colorscheme rose-pine')

vim.lsp.enable('lua_ls')

require('mason').setup({
    ui = { icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗'
    } }
})

require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls' }
})

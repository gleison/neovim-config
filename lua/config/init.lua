-- Initial configurations
require('config.remap')
require('config.set')

vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
    { src = 'https://github.com/neovim/nvim-lspconfig', name = 'lspconfig'},
    { src = 'https://github.com/mason-org/mason.nvim', name = 'mason'},
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim', name = 'mason-lspconfig'},
    { src = 'https://github.com/MunifTanjim/nui.nvim', name='nui'},
    { src = 'https://github.com/mfussenegger/nvim-dap', name='nvim-dap'},
    { src = 'https://github.com/nvim-java/nvim-java', name='nvim-java'}
})

vim.cmd('colorscheme rose-pine')

vim.lsp.enable('lua_ls')
vim.lsp.enable('jdtls')

require('java').setup({
    spring_boot_tools = {
        enable = false
    }
})

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

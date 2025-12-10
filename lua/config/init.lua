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

vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set('i', '<C-Space>', function()
                vim.lsp.completion.get()
            end)
        end
    end,
})
vim.cmd('set completeopt+=noselect')

vim.diagnostic.config({ virtual_lines = true })


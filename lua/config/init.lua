-- Initial configurations
require('config.remap')
require('config.set')

vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
    { src = 'https://github.com/neovim/nvim-lspconfig', name = 'lspconfig'}
})
vim.cmd('colorscheme rose-pine')

vim.lsp.config('lua_ls', {
    settings = {
    Lua = {
      diagnostics = { globals = {'vim'} },
    },
  },
})
vim.lsp.enable('lua_ls')


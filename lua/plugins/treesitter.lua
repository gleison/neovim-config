return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local treesitter = require('nvim-treesitter.configs')
        treesitter.setup({
            ensure_installed = { 'lua', 'vim', 'html', 'go', 'java', 'javascript' },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        })
    end,
}

return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    config = function()
        local telescope = require('telescope')
        telescope.load_extension('ui-select')
        telescope.load_extension('fzf')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
        vim.keymap.set('n', '<leader>gf', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>cf', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>zf', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>O', builtin.lsp_document_symbols, {})
    end,
}

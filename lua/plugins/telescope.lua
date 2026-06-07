return {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = {
        {
            'nvim-telescope/telescope.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
            },
            keys = {
                { '<leader>ff', '<cmd>Telescope find_files<cr>' },
                { '<leader>fb', '<cmd>Telescope buffers<cr>' },
                { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
                { '<leader>fh', '<cmd>Telescope help_tags<cr>' },
            }
        }
    },
    config = function()
        require('telescope').setup ({
            extensions = {
                ['ui-select'] = require('telescope.themes').get_dropdown({})
            }
        })
        require('telescope').load_extension('ui-select')
    end,
}

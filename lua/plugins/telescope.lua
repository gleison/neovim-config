return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>' }
    }
}

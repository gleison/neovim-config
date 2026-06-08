vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.hl.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
    callback = function(event)
        local buf = event.buf
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', 'gr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
        vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })

        vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })
        vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = buf, desc ='[R]e[n]ame' })

        vim.keymap.set( { 'n', 'x' }, 'ga', vim.lsp.buf.code_action, { buffer = buf, desc ='[G]oto Code [A]ction' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = buf, desc ='[G]oto [D]eclaration' })
    end,
})

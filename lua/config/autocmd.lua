vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.hl.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Simple way to go back to tree
local api = require "nvim-tree.api"
vim.keymap.set('n', '<leader>q', api.tree.focus, {})


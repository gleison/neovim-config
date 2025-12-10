-- Line Number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Always shows sign column
vim.o.signcolumn = 'yes'

--Border
vim.o.winborder = 'rounded'

-- Identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- No wrap lines
vim.opt.wrap = false

-- No backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Some colors
vim.opt.termguicolors = true

-- Scroll always show last 8 lines
vim.opt.scrolloff = 8

-- Faster completion
vim.opt.updatetime = 50

-- Show 120 colum limit
vim.opt.colorcolumn = "120"

-- Netrw configuration
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.newrw_keepdir = 0



-- Line Number
vim.opt.nu = true
vim.opt.relativenumber = false

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

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- New splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- display whitespace characters in the editor
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- Include subdirectories in search
vim.opt.path:append("**")

-- Some colors
vim.opt.termguicolors = true

-- Scroll always show last 8 lines
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Show 120 colum limit
vim.opt.colorcolumn = "120"

-- Netrw configuration
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.newrw_keepdir = 0


-- Default Options

-- Show Line Numbers
vim.opt.number = true
-- Show Relative Line Numbers
vim.opt.relativenumber = true

-- Only tab 4 (8 is default)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
-- Number of spaces for autoindent
vim.opt.shiftwidth = 4
-- Use appropriate number of spaces from insert mode
vim.opt.expandtab = true
-- Smart indent when starting new lines
vim.opt.smartindent = true

-- Don't use a swapfile
vim.opt.swapfile = false
-- Don't use a backip file
vim.opt.backup = false
-- Use an undofile
vim.undofile = true
-- Store undo history directory
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Don't persist highlight of search
vim.opt.hlsearch = false
-- Show pattern matches as you type
vim.opt.incsearch = true

-- Show more colors
vim.opt.termguicolors = true

-- Buffer at least 8 lines above and below when scrolling
vim.opt.scrolloff = 8

-- Update faster
vim.opt.updatetime = 250

-- Column to indicate line length
vim.opt.colorcolumn = "100"

-- Splits below for vertical splits
vim.opt.splitbelow = true
-- Splits above for horizontal splits
vim.opt.splitright = true

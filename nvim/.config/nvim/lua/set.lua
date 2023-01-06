-- Default sets
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.errorbells = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir= os.getenv("HOME") .. "/.vim/undodir"
vim.undofile = true

vim.opt.hlsearch=false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.pyxversion = 3

vim.opt.splitbelow = true
vim.opt.splitright = true


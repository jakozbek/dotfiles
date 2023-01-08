-- TODO: write descriptions for these, do nnoremaps if needed

-- Set leader
vim.g.mapleader = " "

-- Leader Key Easy write and quit
vim.keymap.set("n", "<leader>s", ":update<CR>", { noremap = true, desc = "[S]ave file", silent = true })

-- Should be a default!
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, desc = "escape insert mode" })

-- Vim Fugitive
vim.keymap.set("n", "<leader>gs", ":G<CR>:only<CR>", {})
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
vim.keymap.set("n", "<leader>gf", ":diffget //2<CR>", {})
vim.keymap.set("n", "<leader>gh", ":diffget //3<CR>", {})

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>", {})

-- NVIM Tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})

-- Gitsigns
vim.keymap.set("n", "<leader>Gr", ":Gitsigns reset_hunk<CR>", {})
vim.keymap.set("n", "<leader>Gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>Gd", ":Gitsigns diffthis<CR>", {})
vim.keymap.set("n", "<leader>Gs", ":Gitsigns stage_buffer<CR>", {})

-- Edit vimr configuration file
vim.keymap.set("n", "<Leader>ve", ":e $MYVIMRC<CR>", {})

-- Reload vimr configuration file
vim.keymap.set("n", "<Leader>vr", ":source $MYVIMRC<CR>", {})

-- Movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv", {})
vim.keymap.set("n", "N", "Nzzzv", {})

-- Greatest remap ever
vim.keymap.set("x", "<leader>p", '"_dP', {})

-- next greatest ever
vim.keymap.set("n", "<leader>y", '"+y', {})
vim.keymap.set("v", "<leader>y", '"+y', {})
vim.keymap.set("n", "<leader>Y", '"+Y', {})

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

-- Echo Location
vim.keymap.set("n", "<leader>pp", "<cmd>echo @%<cr>", {})

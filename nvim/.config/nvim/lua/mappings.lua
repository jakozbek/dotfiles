-- TODO: write descriptions for these, do nnoremaps if needed

-- Set leader
vim.g.mapleader = " "

-- Leader Key Easy write
vim.keymap.set("n", "<leader>s", ":update<CR>", { noremap = true, desc = "[S]ave file", silent = true })

-- Leader key easy quit
vim.keymap.set("n", "<leader>qq", ":q<CR>", { noremap = true, desc = "[Q]uit", silent = true })
vim.keymap.set("n", "<leader>qa", ":qa<CR>", { noremap = true, desc = "[Q]uit [A]ll", silent = true })

-- Should be a default!
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, desc = "escape insert mode" })

-- Replace text under cursor
vim.keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>", {})

-- Vim Fugitive
vim.keymap.set("n", "<leader>gs", ":G<CR>:only<CR>", { desc = "[G]it [S]tatus" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "[G]it [P]ush" })
vim.keymap.set("n", "<leader>gf", ":diffget //2<CR>", {})
vim.keymap.set("n", "<leader>gh", ":diffget //3<CR>", {})

-- Diffview
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "[G]it [D]iff" })
vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "[G]it [Q]uit Diff" })

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>", {})

-- NVIM Tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})

-- Gitsigns
vim.keymap.set("n", "<leader>Gr", ":Gitsigns reset_hunk<CR>", {})
vim.keymap.set("n", "<leader>Gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>Gd", ":Gitsigns diffthis<CR>", {})
vim.keymap.set("n", "<leader>Gs", ":Gitsigns stage_buffer<CR>", {})

-- Movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv", {})
vim.keymap.set("n", "N", "Nzzzv", {})

-- yank whole file
vim.keymap.set("n", "<leader>yy", ":%y<CR>", {})
-- yank whole file to system clipboard
vim.keymap.set("n", "<leader>yY", ":%y+<CR>", {})

-- Yank to system clipboard
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

-- Formatting
vim.keymap.set("n", "<leader>F", "<cmd>Format<cr>", { desc = "[F]ormat buffer" })

-- Copilot
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "[C]opilot [C]hat toggle" })

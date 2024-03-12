-- Entrypoint
require("options")
require("mappings")
require("plugins")

-- Removes whitespaces on save
local file_writes_group = vim.api.nvim_create_augroup("File Writes", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = file_writes_group,
	command = [[%s/\s\+$//e]],
})

-----------------------
-----------------------
-- Wrap on .md files --
local md_group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md" },
	group = md_group,
	command = "setlocal wrap",
})
-- Wrap on .md files --
-----------------------
-----------------------

-- Colors
vim.cmd.colorscheme "catppuccin"


-- Entrypoint
require("options")
require("mappings")
require("plugins")

-- Formatting autocommands
local file_writes_group = vim.api.nvim_create_augroup("File Writes", { clear = true })

-- Remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = file_writes_group,
	command = [[%s/\s\+$//e]],
})

-- Formats file using formatter
vim.api.nvim_create_autocmd("BufWritePost", {
	group = file_writes_group,
	command = ":FormatWrite",
})

-- For CopilotChat using nvim 0.10.X
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "copilot-*",
	callback = function()
		vim.opt.completeopt = vim.opt.completeopt + "noinsert" + "noselect"
	end,
})

vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "copilot-*",
	callback = function()
		vim.opt.completeopt = vim.opt.completeopt - "noinsert" - "noselect"
	end,
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
vim.cmd.colorscheme("catppuccin")

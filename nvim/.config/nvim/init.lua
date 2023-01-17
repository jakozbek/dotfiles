-- Entrypoint
require("options")
require("mappings")
require("work")
require("plugins")

-- Colorscheme
-- Options: catpuccin, kanagawa
-- Paste the colorscheme you would like to use below
-- -- TODO: why is transparency not set at init
vim.api.nvim_command("colorscheme kanagawa")

-- Removes whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Github Copilot
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-----------------------
-----------------------
-- Wrap on .md files --
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md" },
	group = group,
	command = "setlocal wrap",
})
-- Wrap on .md files --
-----------------------
-----------------------

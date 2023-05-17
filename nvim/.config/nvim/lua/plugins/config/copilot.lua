-- TODO: not being used right now
-- For copilot.vim
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- -- Add line for copilot panel
-- vim.api.nvim_set_keymap("n", "<leader>cp", "<cmd>Copilot panel<CR>", { silent = true })

-- For copilot.lua
require("copilot").setup({
	panel = {
		auto_refresh = true,
		layout = {
			position = "right",
			ratio = 0.3,
		},
	},
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = "<C-j>",
		},
	},
})

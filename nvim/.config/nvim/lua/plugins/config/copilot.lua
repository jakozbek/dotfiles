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

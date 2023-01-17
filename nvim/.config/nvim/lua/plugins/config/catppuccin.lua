require("catppuccin").setup({
	flavour = "mocha", -- mocha, macchiato, frappe, latte
	transparent_background = true,
	-- Does term_colors do anything?
	term_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
	style = {
		comments = "italic",
		conditionals = "italic",
	},
})

-- init.lua sets the colorscheme

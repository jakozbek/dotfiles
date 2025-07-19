local telescope = require("telescope")

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
	defaults = {
		file_ignore_patterns = { ".git/*", "node_modules" },
	},
	pickers = {
		find_files = { hidden = true },
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				},
				n = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				},
			},
		},
	},
})

telescope.load_extension("fzf")

-- Mapping
local builtin = require("telescope.builtin")

local find_config_files = function()
	builtin.find_files({
		prompt_title = "< Nvim Config >",
		cwd = "~/.config/nvim/",
	})
end

local find_org_files = function()
	builtin.find_files({
		prompt_title = "< jOrg Mode >",
		cwd = "~/my-orgs/",
	})
end

vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

local grep_not_test_files = function()
	builtin.live_grep({ glog_pattern = "!*test*" })
end

local find_ignored_files = function()
	builtin.find_files({ no_ignore = true })
end

vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ][ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fi", find_ignored_files, { desc = "[F]ind [I]gnored files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind with [G]rep" })
vim.keymap.set("n", "<leader>fnt", grep_not_test_files, { desc = "[F]ind [n]ot [t]est" })

vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord under cursor" })
vim.keymap.set("n", "<leader>fG", builtin.git_files, { desc = "[F]ind [G]it files" })
vim.keymap.set("n", "<leader>fm", builtin.keymaps, { desc = "[F]ind [M]appings" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp tags" })
vim.keymap.set("n", "<leader>fp", builtin.planets, { desc = "[F]ind [P]lanets (use the telescope!)" })
vim.keymap.set("n", "<leader>fc", find_config_files, { desc = "[F]ind [C]onfig" })
vim.keymap.set("n", "<leader>fo", find_org_files, { desc = "[F]ind j[O]rg mode" })
vim.keymap.set("n", "<leader>fC", builtin.colorscheme, { desc = "[F]ind [C]olorschemes" })

require("nvim-treesitter.configs").setup({
	sync_install = false,
	auto_install = true,
	ensure_installed = { "lua", "rust", "python", "vim", "c", "org" },
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = { "org", "markdown", "gitcommit", "json", "typescript" },
		disable = { "csv" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
	-- TODO: look at the move table for treesitter
})

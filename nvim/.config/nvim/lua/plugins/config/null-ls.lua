local null_ls = require("null-ls")

-- These do not come from Mason even if they are also installed there
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.buf,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.shfmt.with({
			filetypes = { "sh", "zsh" },
		}),
		null_ls.builtins.formatting.black.with({
			extra_args = { "--line-length", "120" },
		}),
		null_ls.builtins.formatting.isort.with({
			extra_args = {
				"--multi-line",
				"3",
				"--trailing-comma",
				"--force-grid-wrap",
				"0",
				"--use-parentheses",
				"--line-width",
				"120",
				"--skip",
				"generated",
				"--skip",
				"reports",
			},
		}),
	},
})

local null_ls = require("null-ls")

-- These do not come from Mason even if they are also installed there
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.shfmt.with({
			filetypes = { "sh", "zsh" },
		}),
		null_ls.builtins.diagnostics.zsh,
	},
})

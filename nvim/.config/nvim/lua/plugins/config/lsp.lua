-- Setting for nvim-lspconfig

-- neodev must be called before settings up lsp config
require("neodev").setup()

-----------------------------
-----------------------------
-- Suggested Configuration --

-- From suggested-configuration: https://github.com/neovim/nvim-lspconfig#suggested-configuration

vim.lsp.set_log_level("debug")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>c", vim.diagnostic.setloclist, opts)

-- null-ls should be setup before lspconfig
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Don't enable below when using nvim-cmp
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- chagned from default map <C-k> as it is being used for navigation
	vim.keymap.set("n", "<C-c>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

	-- Formatting
	local formatter = function(buffer)
		vim.lsp.buf.format({
			filter = function(format_client)
				-- For lua, we want to use stylua so we return false for the language server
				if format_client.name == "sumneko_lua" then
					return false
				else
					return true
				end
			end,
			bufnr = buffer,
		})
	end

	-- Use this for formatting not on save
	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		formatter(bufnr)
	end, { desc = "Format current buffer with null-ls" })

	-- if you want to set up formatting on save, you can use this as a callback
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				formatter(bufnr)
			end,
		})
	end
end

-- Suggested Configuration --
-----------------------------
-----------------------------

--------------------
--------------------
-- Autocompletion --

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
-- TODO: go more into cmp setup
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	}),
	sources = { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "orgmode" } },
})

-- LSP Kind With CMP to show symbols --
local lspkind = require("lspkind")

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				-- ... customization
				return vim_item
			end,
		}),
	},
})

-- Autocompletion --
--------------------
--------------------

----------------------
-- Language Servers --
----------------------

-- This order must be followed: mason, mason-lspconfig, lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer" },
})

-- Rust Analyzer
local lsp_config = require("lspconfig")

lsp_config.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			cargo = { features = "all" },
			checkOnSave = { command = "clippy" },
			rustfmt = {
				extraArgs = { "+nightly" },
			},
		},
	},
})

-- Lua
lsp_config.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Bash
lsp_config.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "sh", "zsh" },
})

-- Python
local util = require("lspconfig.util")

local pyright_root_files_first = {
	"pyproject.toml",
	"pyrightconfig.json",
}

lsp_config.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = util.root_pattern(unpack(pyright_root_files_first)),
	-- settings map to those found in: [pyright/docs/settings.md](https://github.com/microsoft/pyright/blob/main/docs/settings.md)
	-- NOT those found in Configuraiton which is project specific
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		-- python = {
		-- 	analysis = {
		-- typeCheckingMode = "off",
		-- autoSearchPaths = true,
		-- useLibraryCodeForTypes = true,
		-- 	},
		-- },
	},
})

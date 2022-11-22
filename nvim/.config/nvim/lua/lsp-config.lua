-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local mapping_opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<space>e',
                        '<cmd>lua vim.diagnostic.open_float()<CR>', mapping_opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
                        mapping_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',
                        mapping_opts)
vim.api.nvim_set_keymap('n', '<space>q',
                        '<cmd>lua vim.diagnostic.setloclist()<CR>', mapping_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<cmd>lua vim.lsp.buf.declaration()<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<cmd>lua vim.lsp.buf.definition()<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<cmd>lua vim.lsp.buf.hover()<CR>', mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                '<cmd>lua vim.lsp.buf.implementation()<CR>',
                                mapping_opts)
    -- TODO: map to something else, <C-k> is being used for navigation
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',
    --                             '<cmd>lua vim.lsp.buf.signature_help()<CR>',
    --                             mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa',
                                '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr',
                                '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
                                '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D',
                                '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca',
                                '<cmd>lua vim.lsp.buf.code_action()<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>',
                                mapping_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f',
                                '<cmd>lua vim.lsp.buf.formatting()<CR>',
                                mapping_opts)
end

--------------------
-- Autocompletion --
--------------------

-- TODO: move capabilities further down
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup {
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
    },
    sources = {{name = 'nvim_lsp'}, {name = 'luasnip'}}
}

-- LSP Kind With CMP to show symbols --
local lspkind = require('lspkind')

cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                -- ... customization
                return vim_item
            end
        })
    }
}

----------------------
-- Language Servers --
----------------------

require("mason").setup()
local mason_installer = require("mason-lspconfig").setup()

local def_flags = {debounce_text_changes = 150}

-- Rust Analyzer
require"lspconfig".rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = def_flags,
    settings = {
        ["rust-analyzer"] = {
            cargo = {allFeatures = true},
            procMacro = {enable = true},
            checkOnSave = {command = "clippy"}
            -- experimental = {procAttrMacros = false},
        }
    }
}

-- Jedi Language Server
require"lspconfig".jedi_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = def_flags
}

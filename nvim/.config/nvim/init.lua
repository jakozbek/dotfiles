-- Entrypoint
require('work')
require('mappings')
require('options')
require('plugins')

-- First require plugins
require('lsp-config')

require('plugins.config.catppuccin')
require('plugins.config.commenter')
require('plugins.config.gitsigns')
require('plugins.config.lightspeed')
require('plugins.config.lualine')
require('plugins.config.null-ls')
require('plugins.config.nvim-tree')
require('plugins.config.org')
require('plugins.config.telescope')
require('plugins.config.treesitter')
require('plugins.config.whichkey')

----------------
-- Autoformat --
----------------
-- TODO: what's going wrong with this and lua files
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format {async = true}]]

-- Removes whitespaces on save
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    command = [[%s/\s\+$//e]]
})

-- TODO: do in lua format
-- Packer autocmd
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Github Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")',
    { silent = true, expr = true })

-----------------------
-----------------------
-- Wrap on .md files --
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings",
    { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.md' },
    group = group,
    command = 'setlocal wrap'
})
-- Wrap on .md files --
-----------------------
-----------------------


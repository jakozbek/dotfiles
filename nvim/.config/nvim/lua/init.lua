-- First require plugins
require('plugins')
require('lsp-config')
require('work')

require('user.commenter')
require('user.gitsigns')
require('user.lightspeed')
require('user.lsp-colors')
require('user.lualine')
require('user.nvim-tree')
require('user.telescope')
require('user.toggleterm')
require('user.treesitter')
require('user.whichkey')

-- Github Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")',
                        {silent = true, expr = true})

-- Wrap on .md files
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings",
                                          {clear = true})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {'*.md'},
    group = group,
    command = 'setlocal wrap'
})

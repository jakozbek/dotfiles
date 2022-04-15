-- First require plugins
require('plugins')
require('lsp-config')
require('work')

require('user.commenter')
require('user.gitsigns')
require('user.lightspeed')
require('user.lsp-colors')
require('user.lsp-installer')
require('user.lualine')
require('user.nvim-tree')
require('user.telescope')
require('user.toggleterm')
require('user.tokyonight')
require('user.treesitter')
require('user.whichkey')

-- Github Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")',
                        {silent = true, expr = true})

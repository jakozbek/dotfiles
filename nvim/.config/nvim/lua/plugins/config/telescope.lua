local tele = require('telescope')

tele.setup {
    extensions = { fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    defaults = {
        file_ignore_patterns = {".git/*", "node_modules"},
    },
    pickers = {find_files = {hidden = true}}
}

tele.load_extension('fzf')

-- Mapping
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind with [G]rep' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fm', builtin.keymaps, { desc = '[F]ind [M]appings' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp tags' })

local M = {}

M.search_dotfiles = function()
    builtin.find_files({
        promt_title = "< .dotfiles >",
        cwd = "~/.dotfiles"
    })
end

return M

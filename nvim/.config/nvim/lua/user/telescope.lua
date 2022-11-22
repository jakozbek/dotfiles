local tele = require('telescope')

tele.setup {
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    defaults = {
        file_ignore_patterns = {".git/*", "node_modules"},
        layout_strategy = "vertical"
    },
    pickers = {find_files = {hidden = true}}
}

tele.load_extension('fzf')

local Module = {}

Module.search_dotfiles = function()
    require('telescope.builtin').find_files({
        promt_title = "< .dotfiles >",
        cwd = "~/.dotfiles"
    })
end

Module.search_org = function()
    require('telescope.builtin').find_files({
        promt_title = "< Jesse's Awesome Custom Org Mode >",
        cwd = "~/personal-dev/org"
    })
end

return Module

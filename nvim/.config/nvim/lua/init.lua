require('lualine').setup {
    options = {theme = 'gruvbox'},
    -- sections = { lualine_c = { "filename", 'data', "require'lsp-status'.status()" } }, -- if want progres in statusline
    tabline = {lualine_a = {'buffers'}, lualine_z = {'tabs'}}
}

require"fidget".setup {}

-- TODO: is this working?
require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
})

local lsp_installer = require("nvim-lsp-installer")

-- ui configuration
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Treesitter
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    }
}

-- NVIM Tree
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
    disable_netrw = false,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = true,
    auto_reload_on_write = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {enable = true, auto_open = true},
    diagnostics = {
        enable = true,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
    system_open = {cmd = nil, args = {}},
    filters = {dotfiles = false, custom = {}},
    git = {enable = true, ignore = true, timeout = 500},
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        preserve_window_proportions = false,
        mappings = {custom_only = false, list = {}},
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {cmd = "trash", require_confirm = true},
    actions = {
        change_dir = {enable = true, global = false},
        open_file = {
            quit_on_open = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {filetype = {"notify", "packer", "qf"}}
            }
        }
    }
}

-- Telescope custom fns --
local Module = {}
Module.search_dotfiles = function()
    require('telescope.builtin').find_files({
        promt_title = "< .dotfiles >",
        cwd = "~/.dotfiles"
    })
end

return Module

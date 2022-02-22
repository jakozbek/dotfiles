require('lualine').setup {
    options = { theme = 'gruvbox' },
    --sections = { lualine_c = { "filename", 'data', "require'lsp-status'.status()" } }, -- if want progres in statusline
    tabline = {
      lualine_a = {'buffers'},
      lualine_z = {'tabs'}
    }
}

require"fidget".setup{}

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

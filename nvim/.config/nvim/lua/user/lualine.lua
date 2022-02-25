require('lualine').setup {
    options = {theme = 'gruvbox'},
    -- sections = { lualine_c = { "filename", 'data', "require'lsp-status'.status()" } }, -- if want progres in statusline
    tabline = {lualine_a = {'buffers'}, lualine_z = {'tabs'}}
}

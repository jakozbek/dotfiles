local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- TODO: enable this once I can match formatting to our github actions
        -- null_ls.builtins.formatting.yamlfmt
    },
})

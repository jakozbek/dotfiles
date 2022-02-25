vim.api.nvim_set_keymap('n', '<C-_>',
                        '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('x', '<C-_>',
                        '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>',
                        {noremap = true, silent = true})

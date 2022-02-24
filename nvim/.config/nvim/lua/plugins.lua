return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    -- Completion of Code
    -- use { 'neoclide/coc.nvim', branch = 'release' }

    -- NVIM LSP Config
    use 'neovim/nvim-lspconfig'
    -- use 'nvim-lua/lsp-status.nvim' -- Statusline for lsp

    -- Autocompletion for LSP
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- LSP Installer --
    use 'williamboman/nvim-lsp-installer'

    -- get icons for functions, etc. in LSP completion
    use 'onsails/lspkind-nvim'

    -- Treesitter --
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icon
        }
    }

    -- Toggle an area to view all current errors and warnings
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
            }
        end
    }

    -- Rust Additional Tools For LSP --
    use 'simrat39/rust-tools.nvim'

    -- Crates
    use {
        'saecki/crates.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('crates').setup() end
    }

    -- Lua --
    use 'andrejlevkovitch/vim-lua-format'

    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    -- TODO: am I using?
    use 'christoomey/vim-tmux-navigator'

    -- Like VSCODE
    use 'ryanoasis/vim-devicons'

    -- Commenting
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- TODO: switch with nvim native gitsigns
    -- Potentially has performance issues
    use 'airblade/vim-gitgutter'

    -- Git
    use 'tpope/vim-fugitive'

    -- Searching
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                },
                defaults = {file_ignore_patterns = {".git/*"}},
                pickers = {find_files = {hidden = true}}
            }

            require('telescope').load_extension('fzf')
        end
    }

    -- TODO: test this out
    use {'ThePrimeagen/harpoon', requires = {{'nvim-lua/plenary.nvim'}}}

    ---------
    -- QOL --
    ---------

    use 'easymotion/vim-easymotion'
    use 'tpope/vim-surround'
    use 'raimondi/delimitmate' -- for auto closing {}, (), "", etc.

    -- Used to display Statusline from LSP in corner
    use {'j-hui/fidget.nvim'}

    -- TODO: is this needed?
    use 'folke/lsp-colors.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Theme
    use 'morhetz/gruvbox'
end)

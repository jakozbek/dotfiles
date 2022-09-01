return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    -- NVIM LSP Config
    use 'neovim/nvim-lspconfig'

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

    -- File Tree --
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
        config = function() require("trouble").setup {} end
    }

    -- Rust --

    -- Rust Additional Tools For LSP
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

    -- Commenting
    use {
        'numToStr/Comment.nvim'
        -- config = function() require('Comment').setup() end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'}
        -- tag = 'release' -- To use the latest release
    }

    -- Git
    use 'tpope/vim-fugitive'

    -- File Searching
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        }
    }

    ---------
    -- QOL --
    ---------

    use 'ggandor/lightspeed.nvim'

    use 'tpope/vim-surround'

    use 'raimondi/delimitmate' -- for auto closing {}, (), "", etc.

    -- Used to display Statusline from LSP in corner
    use {'j-hui/fidget.nvim', config = function() require"fidget".setup {} end}

    -- TODO: is this needed?
    use 'folke/lsp-colors.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Which key, never for get a mapping!
    use "folke/which-key.nvim"

    -- Themes
    use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'

    -- Presentations
    use 'sotte/presenting.vim'

    -- Markdown
    use 'ellisonleao/glow.nvim'

    -- Github Copilot
    use 'github/copilot.vim'
end)

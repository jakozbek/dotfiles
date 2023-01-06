return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    -- NVIM LSP Config
    use 'neovim/nvim-lspconfig'

    -- LSP Related --
    -----------------
    -----------------

    -- Autocompletion for LSP
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- LSP Installer --
    use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }

    -- Null-ls --
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Used to display Statusline from LSP in corner
    use { 'j-hui/fidget.nvim', config = function() require "fidget".setup {} end }

    -- get icons for functions, etc. in LSP completion
    use 'onsails/lspkind-nvim'

    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            vim.diagnostic.config({ virtual_text = false })
            vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle,
                { desc = "Toggle lsp_lines" })
            require("lsp_lines").setup()
        end
    })

    -----------------
    -----------------
    -- LSP Related --

    -- TODO: configure better --
    -- Dashboard --
    use { 'glepnir/dashboard-nvim' }

    -- Treesitter --
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

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

    ----------
    -- Rust --

    -- Rust Additional Tools For LSP
    use 'simrat39/rust-tools.nvim'

    -- Crates
    use {
        'saecki/crates.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('crates').setup() end
    }

    -- Rust --
    ----------

    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    -- Commenting
    use { 'numToStr/Comment.nvim' }

    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Git
    use 'tpope/vim-fugitive'

    -- File Searching
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }

    ---------
    -- QOL --
    ---------

    -- Surround --
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
                -- Conflicts with lightspeed.nvim
                keymaps = { visual = "Z" }
            })
        end
    })

    -- Motions --
    use 'ggandor/lightspeed.nvim'

    use 'raimondi/delimitmate' -- for auto closing {}, (), "", etc.

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Which key, never for get a mapping!
    use "folke/which-key.nvim"

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin", }

    -- Github Copilot
    use 'github/copilot.vim'

    -- Orgmode nvim
    use 'nvim-orgmode/orgmode'
end)

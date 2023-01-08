-- TODO: this kind of works, but a lot of errors are still hit on the initial load
-- For bootstrapping packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Executes packer compile whenever file change is made
vim.api.nvim_create_augroup('packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = 'lua/plugins/config/*.lua,plugins.lua',
    group = 'packer',
    command = [[source lua/plugins.lua | PackerCompile]]
})

return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- LSP Related --
    -----------------
    -----------------

    -- LSP Configuration & Plugins
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
        config = function()
            -- neodev must be called before settings up lsp config
            require('neodev').setup()
            require('lsp-config')
        end
    }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    }

    -- Null-ls --
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('plugins.config.null-ls')
        end
    }

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

    -- TODO: test this
    use {
        'lewis6991/impatient.nvim',
        config = function()
            pcall(require, 'impatient')
        end
    }

    -- Start Page --
    use { 'goolord/alpha-nvim',
        config = function()
            local default_config = require 'alpha.themes.dashboard'.config

            require 'alpha'.setup(default_config)
        end,
    }

    -- Treesitter --
    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter', --TODO: cool TS stuff from https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        config = function()
            require('plugins.config.treesitter')
        end
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- File Tree --
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icon
        },
        config = function()
            require('plugins.config.nvim-tree')
        end
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
    use { 'numToStr/Comment.nvim',
        config = function()
            require('plugins.config.commenter')
        end
    }

    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.config.gitsigns')
        end
    }

    -- Git
    use 'tpope/vim-fugitive'

    -- File Searching
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
        config = function()
            require('plugins.config.telescope')
        end
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
    use { 'ggandor/lightspeed.nvim',
        config = function()
            require('plugins.config.lightspeed')
        end
    }

    use 'raimondi/delimitmate' -- for auto closing {}, (), "", etc.

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('plugins.config.lualine')
        end
    }

    -- Which key, never for get a mapping!
    use {
        "folke/which-key.nvim",
        config = function()
            require('plugins.config.whichkey')
        end
    }

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin",
        config = function()
            require('plugins.config.catppuccin')
        end
    }

    -- Github Copilot
    use 'github/copilot.vim'

    -- Orgmode nvim
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('plugins.config.org')
        end,

    }


    -- Used at bootstrap
    if packer_bootstrap then
        require('packer').sync()
    end
end)

return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager

    -- Completion of Code
    use { 'neoclide/coc.nvim', branch = 'release' }

    -- TODO: am I using?
    -- vim-tmux-navigator
    use 'christoomey/vim-tmux-navigator'

    -- Like VSCODE
    -- NERD Tree
    use 'ryanoasis/vim-devicons'
    use {
        'Xuyuanp/nerdtree-git-plugin',
        requires = { {'preservim/nerdtree'} }
    }
    -- Commenting like vscode
    use 'preservim/nerdcommenter'
    -- sidebar code minimap
    use 'wfxr/minimap.vim'

    -- Potentially has performance issues
    use 'airblade/vim-gitgutter'

    -- Git
    use 'tpope/vim-fugitive'

    -- Searching
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function() require('telescope').setup{
            defaults = {
                file_ignore_patterns = {
                    ".git/*"
                }
            },
            pickers = {
                find_files = {
                    hidden = true
                }
            }
        }
        end
    }

    use {
        'ThePrimeagen/harpoon',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    ---------
    -- QOL --
    ---------

    use 'easymotion/vim-easymotion'
    use 'tpope/vim-surround'
    use 'raimondi/delimitmate' -- for auto closing {}, (), "", etc.

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Rust
    use 'rust-lang/rust.vim'
    -- TODO: don't use tagbar and ALE
    use 'preservim/tagbar'
    use 'dense-analysis/ale'

    -- Theme
    use 'morhetz/gruvbox'
end)


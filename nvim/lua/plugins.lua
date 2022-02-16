return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager

    -- Completion of Code
    use { 'neoclide/coc.nvim', branch = 'release' }

    -- vim-tmux-navigator
    use 'christoomey/vim-tmux-navigator'

    -- NERD Tree
    use 'ryanoasis/vim-devicons'
    use {
        'Xuyuanp/nerdtree-git-plugin',
        requires = { {'preservim/nerdtree'} }
    }

    -- Like VSCODE

    -- Commenting like vscode
    use 'preservim/nerdcommenter'

    use 'wfxr/minimap.vim'

    -- Potentially has performance issues
    --use 'airblade/vim-gitgutter'

    -- I might like vim-gitgutter more
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }

    -- Searching
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'ThePrimeagen/harpoon',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Easymotion
    use 'easymotion/vim-easymotion'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Rust
    use 'rust-lang/rust.vim'
end)


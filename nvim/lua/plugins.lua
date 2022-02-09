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

    -- Commenting like vscode
    use 'preservim/nerdcommenter'

    -- Potentially has performance issues
    use 'airblade/vim-gitgutter'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Rust
    use 'rust-lang/rust.vim'
end)

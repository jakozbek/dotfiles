let g:mapleader = ' '

syntax on

set noerrorbells
set relativenumber
set nu rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80

colorscheme molokai

filetype plugin on

" Leader Key Remaps
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" NERD Tree Toggle
nnoremap <C-n> :NERDTreeToggle<CR>

" Insert Mode Remapping
imap jj <Esc>

" packer
lua require('plugins')

"Ctrl + / commenting for nvim
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle
imap <C-_> <plug>NERDCommenterInsert

" Telescope
nnoremap <leader>ff :lua require'telescope.builtin'.find_files{}<CR>

" Additional Plugin Config
source $HOME/.config/nvim/plugin-config/coc.vim

" Rust
let g:rustfmt_autosave = 1

" Nav and Resizing in NVIM
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

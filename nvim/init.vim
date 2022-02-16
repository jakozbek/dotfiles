let g:mapleader = ' '

syntax on

set noerrorbells
set relativenumber
set nu rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
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
nnoremap <leader>qq :q!<CR>

" NERD Tree Toggle
nnoremap <C-n> :NERDTreeToggle<CR>

" Insert Mode Remapping
imap jj <Esc>

" packer
lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

"Ctrl + / commenting for nvim
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle
imap <C-_> <plug>NERDCommenterInsert

" Additional Plugin Config
source $HOME/.config/nvim/plugin-config/coc.vim

" Rust
let g:rustfmt_autosave = 1

" Nav and Resizing in NVIM
"nnoremap <leader>h :wincmd h<CR>
"nnoremap <leader>j :wincmd j<CR>
"nnoremap <leader>k :wincmd k<CR>
"nnoremap <leader>l :wincmd l<CR>

" Minimap
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1

""" Searching

" Telescope
" " Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Harpoon
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>

" EasyMotion
nmap s <Plug>(easymotion-s2)

" Airlines
let g:airline#extensions#tabline#enabled = 1


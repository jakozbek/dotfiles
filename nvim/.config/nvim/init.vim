let g:mapleader = ' '

syntax on

" Default sets
set updatetime=100
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
set colorcolumn=120
set showmatch
set pyxversion=3

filetype plugin on

" Leader Key Easy write and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>qq :q!<CR>
imap jj <Esc>

" packer
" TODO: set up packer bootstrapping
lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" Init Lua Scripts for Further Plugin config
lua require('lsp-config')
lua require('init')

" Gruvbox Theme: must happen after packer initialization
set background=dark
let g:gruvbox_contrast_dark='hard'

autocmd vimenter * ++nested colorscheme gruvbox

" Ctrl + / vscode-like commenting for nvim
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle
imap <C-_> <plug>NERDCommenterInsert

" Minimap
" TODO: possibly remove
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1

""" Searching
" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Vim Fugitive
nmap <leader>gs :G<CR>
nmap <leader>gp :Git push<CR>

" Trouble
nnoremap <leader>tt <cmd>TroubleToggle<CR>

" Rust format on save
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" EasyMotion
nmap s <Plug>(easymotion-s2)

" Airlines
let g:airline#extensions#tabline#enabled = 1

" TODO: change to gitsigns
" GitGutter
set signcolumn=yes
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1


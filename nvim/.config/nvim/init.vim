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
set hidden " For toggleterm
set nohlsearch " Don't keep search highlighted

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
lua require('work')

" Lsp
nnoremap <leader>lr <cmd>LspRestart<CR>

" Gruvbox Theme: must happen after packer initialization
set background=dark
let g:gruvbox_contrast_dark='hard'

autocmd vimenter * ++nested colorscheme gruvbox

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
nmap <leader>gf :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>

" Trouble
nnoremap <leader>tt <cmd>TroubleToggle<CR>

""" Languages

" Rust format on save
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" Lua format on save
autocmd BufWrite *.lua call LuaFormat()

" EasyMotion
nmap s <Plug>(easymotion-s2)

" Airlines
let g:airline#extensions#tabline#enabled = 1

" Telescope
nnoremap <leader>vd :lua require('user.telescope').search_dotfiles()<CR>

" NVIM Tree
nnoremap <C-n> :NvimTreeToggle<CR>

" Maybe use something like this in the future, I would only want it to popup
" if I open nvim on the directory, not any file
" autocmd VimEnter * lua require('telescope.builtin').find_files()


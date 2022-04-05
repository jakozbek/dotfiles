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

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" Run initialization from lua 
lua require('init')

" Lsp
nnoremap <leader>lr <cmd>LspRestart<CR>

" TODO: remove if not using gruvbox anymore
" Gruvbox Theme: must happen after packer initialization
set background=dark
let g:gruvbox_contrast_dark='hard'

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
nnoremap <leader>jo :lua require('user.telescope').search_org()<CR>

" NVIM Tree
nnoremap <C-n> :NvimTreeToggle<CR>

" Gitsigns
nnoremap <leader>Gr :Gitsigns reset_hunk<CR>
nnoremap <leader>Gp :Gitsigns preview_hunk<CR>
nnoremap <leader>Gd :Gitsigns diffthis<CR>
nnoremap <leader>Gs :Gitsigns stage_buffer<CR>

" Markdown stuff
let g:markdown_fenced_languages = ['json', 'vim', 'c', 'rust', 'python', 'sql', 'sh']
let g:presenting_font_large = 'big'
let g:presenting_font_small = 'mini'
"

" ---------------HEADER---------------{{{
"
" Please use with cation this setup will lead to insanity
" <3 - Ian
" }}}

" ---------------Vim Plug---------------{{{
call plug#begin('~/.local/share/nvim/plugged')
    "colo scheme
    Plug 'junegunn/seoul256.vim'
    "fzf search
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    "statusline
    Plug 'itchyny/lightline.vim'
    "git plugins
    Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim' ", {'for': 'git'}
    Plug 'mhinz/vim-signify' ", {'for': 'git'}
    "completion manager
    Plug 'Shougo/deoplete.nvim' | Plug 'roxma/nvim-yarp'
    let g:deoplete#enable_at_startup = 1
    "snips
    Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
    "completion sources
    Plug 'Shougo/neco-syntax'
    Plug 'Shougo/deoplete-clangx', {'for' : ['c','cpp']}
    Plug 'zchee/deoplete-jedi', {'for' : 'python'}
    "nice utils
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-eunuch'
call plug#end()
"}}}

"---------------Lightline---------------{{{
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }
"}}}

"---------------Depolte & Snippets---------------{{{
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Snip Key Maps
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"}}}

"---------------REMAPS-----------------{{{
" best esc
inoremap jk <Esc>
" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
let mapleader = '-'
nnoremap <leader>sv :vsplit .<cr>
noremap <leader>sh :split .<cr>
" sets ; to fzf file search
map ; :Files<CR>
"}}}

"---------------AUTO COMMANDS & VIM FILE WRAPS---------------{{{
"Write txt files on open
autocmd BufNewFile *.txt :write
autocmd BufWritePre * %s/\s\+$//e

"-----------VIM FILE WRAPS-----------
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_i3
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

"---------------DISABLED KEYS----------------{{{
inoremap <Del> <Nop>
nnoremap <Del> <Nop>
inoremap <Up> <Nop>
nnoremap <Up> <Nop>
inoremap <Left> <Nop>
nnoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Right> <Nop>
inoremap <Down> <Nop>
nnoremap <Down> <Nop>
"}}}

"---------------CUSTOM PREFS-----------------{{{
syntax on
filetype plugin indent on
set encoding=utf-8
colo seoul256
set nocompatible
set number
"set relativenumber
set nowrap
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
" :<Tab> will be useful now
set wildmenu

"Keep that damn cursor in the center of the screen
set scrolloff=90

" Give me sane tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

"Use z-f and z-o for all basic folding needs
set foldmethod=manual

"change update time for git gutter
set updatetime=250

"}}}


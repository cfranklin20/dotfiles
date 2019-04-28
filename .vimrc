"--------------VIM PLUG------------{{{
call plug#begin('~/.local/share/nvim/plugged')
" Status line
Plug 'itchyny/lightline.vim'
" Color Scheme
Plug 'junegunn/seoul256.vim'
" Use Git in nvim
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'

call plug#end()
"}}}

"--------------LIGHTLINE-----------{{{
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
    \}
"}}}

"--------------REMAPS--------------{{{
inoremap jk <Esc>
"}}}

"--------------CUSTOM PREFS--------{{{
syntax on
colo seoul256
set nocompatible
set number
set relativenumber
set nowrap
set tw=0
set smartcase
set smarttab
set smartindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

"}}}


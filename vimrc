" basic options {{{
set encoding=utf-8

"colorscheme solarized8_dark_flat

set background=dark
set termguicolors
set t_ut=

syntax on

filetype plugin indent on

set list
set listchars=tab:>-,trail:˽

set foldmethod=marker
nnoremap <space> za

set wildmenu
set wildmode=list:longest

" make it more vi-like
set cpoptions+=v$
set cinoptions+=N-s

" tabbing
set autoindent
set smartindent

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
inoremap <s-tab> <c-v><tab>

" width
set textwidth=79
set colorcolumn=+1
" }}}
" basic remaps {{{
" map the leader before all others
let mapleader=';'
nnoremap <leader>; ;

nnoremap Y y$
noremap / /\v

" }}}
" arrows, lol {{{
inoremap jk <esc>l
inoremap kj <esc>l
inoremap jj <esc>lj
inoremap kk <esc>lk

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
" }}}

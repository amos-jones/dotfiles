" basic options {{{
set encoding=utf-8

"colorscheme solarized8_dark_flat

set background=dark
set termguicolors
set t_ut=

syntax on

filetype plugin indent on

set number

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
" plug {{{
call plug#begin()

Plug 'dense-analysis/ale'


call plug#end()

let b:rust_edition = trim(system('cargo get --edition 2>/dev/null'))
if v:shell_error == 0 && len(b:rust_edition) > 0
    let g:ale_rust_rustfmt_options = '--edition ' .. b:rust_edition
endif

let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['analyzer', 'cargo']}
let g:ale_fixers = {
    \'*': ['trim_whitespace', 'remove_trailing_lines'],
    \'rust': ['rustfmt'],
\}
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1

nmap <silent> <Leader>f <Plug>(ale_fix)
nmap <silent> <Leader>l <Plug>(ale_lint)
nmap <silent> <Leader>r <Plug>(ale_find_references)

nmap <silent> <Leader><Right> <Plug>(ale_previous_wrap)
nmap <silent> <Leader><Left> <Plug>(ale_next_wrap)

" }}}

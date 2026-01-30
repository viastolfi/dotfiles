""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base config
""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number relativenumber
set nu rnu
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=UTF-8
set hlsearch
set colorcolumn=70

set path+=include
set wildignore+=build/**,lib/**

:let mapleader = " "


" Netrw
let g:netrw_banner = 0
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
let g:netrw_browse_split = 4 
autocmd FileType netrw autocmd BufLeave <buffer> if &filetype == 'netrw' | :bd | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} 
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-sensible.git'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap
""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-n> :Git 
nnoremap <leader>ga :Git add -A <CR>
nnoremap <leader>gc :Git commit -m "
nnoremap <leader>gp :Git push <CR>

nnoremap <leader>h :Ex<CR>
nnoremap <leader>m :tabnew<CR>
nnoremap <leader>p :tabn<CR>
nnoremap <leader>o :tabp<CR>

nnoremap <leader>cc :cclose<CR>
nnoremap <leader>co :copen<CR>

nnoremap <leader>vg :vimgrep /<c-r>=expand("<cword>")<cr>/gj **/*

nnoremap <C-c> :%w !wl-copy<CR>

nnoremap <S-t> :!

nnoremap <S-m> :make <CR>:redraw!<CR>:copen<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make setup depending on Filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Go set up
autocmd FileType go call s:GoSetup()

function! s:GoSetup()
  setlocal makeprg=go

  nnoremap <S-m> :make build .<CR>:redraw!<CR>:copen<CR>
endfunction


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

:let mapleader = ","


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
 
Plug 'junegunn/seoul256.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-sensible.git'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap
""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-n> :Git 

nnoremap <S-m> :tabnew<CR>
nnoremap <C-p> :tabn<CR>
nnoremap <C-o> :tabp<CR>
nnoremap <leader>c :cclose<CR>

nnoremap <C-c> :%w !pbcopy<CR>

nnoremap <S-t> :!

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:seoul256_background = 256
colo seoul256-light
set background=light

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make setup depending on Filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Go set up
autocmd FileType go call s:GoSetup()

function! s:GoSetup()
  setlocal makeprg=go

  nnoremap <S-m> :make build .<CR>:redraw!<CR>:copen<CR>
endfunction



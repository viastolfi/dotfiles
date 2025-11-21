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
 
Plug 'junegunn/seoul256.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'junegunn/vader.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap
""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-n> :Git 
nnoremap <leader>ga :Git add -A <CR>
nnoremap <leader>gc :Git commit -m "
nnoremap <leader>gp :Git push <CR>

nnoremap <leader>h :Ex<CR>
nnoremap <S-m> :tabnew<CR>
nnoremap <C-p> :tabn<CR>
nnoremap <C-o> :tabp<CR>
nnoremap <leader>c :cclose<CR>

nnoremap <C-c> :%w !pbcopy<CR>

nnoremap <S-t> :!

nnoremap <S-m> :make <CR>:redraw!<CR>:copen<CR>

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


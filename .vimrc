syntax on
set number relativenumber
set nu rnu
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=UTF-8

call plug#begin()
 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'https://github.com/preservim/nerdtree',
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-sensible.git'

call plug#end()

nnoremap <S-m> :MarkdownPreview<CR>
nnoremap <S-h> :NERDTreeFocus<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <S-n> :Files<CR>
nnoremap <C-g> :Git 

nnoremap <S-m> :tabnew<CR>
nnoremap <C-p> :tabn<CR>
nnoremap <C-o> :tabp<CR>

nnoremap <C-c> :%w !pbcopy<CR>

nnoremap <S-t> :!

let g:seoul256_background = 256
colo seoul256-light
set background=light

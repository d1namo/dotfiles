if !has('gui_running')
  set t_Co=256
endif

colorscheme nord
syntax on
set hlsearch
set ignorecase
set encoding=utf8
set cursorline
set noshowmode
set laststatus=2

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

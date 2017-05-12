if !has('gui_running')
  set t_Co=256
endif

colorscheme nord
syntax on
set hlsearch
set ignorecase
set encoding=utf8
set noshowmode
set laststatus=2
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
cmap w!! w !sudo tee > /dev/null %

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:airline_extensions = []
" Show full path in airline status
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline_powerline_fonts = 1

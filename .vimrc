set cursorline
set clipboard=unnamed
syntax on
set expandtab
set ls=2
set synmaxcol=120
set shiftwidth=2
set tabstop=2

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-p> :CtrlP<CR>
map ,,c :python ReformatTable()<CR>
map ,,f :python ReflowTable()<CR>

"if !has('gui_running')
"        set t_Co=256
"endif

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/philpep/vim-rst-tables'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/jceb/vim-orgmode'
"Plug 'https://github.com/itchyny/calendar.vim'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
"Plug 'blindFS/vim-taskwarrior'
Plug 'https://github.com/tpope/vim-speeddating'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/christoomey/vim-tmux-navigator'

call plug#end()

let g:airline_theme='powerlineish'

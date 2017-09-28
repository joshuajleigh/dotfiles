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
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/tpope/vim-speeddating'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/christoomey/vim-tmux-navigator'

call plug#end()

"powerline stuff
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

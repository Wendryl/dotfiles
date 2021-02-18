syntax on

set number
set relativenumber
set confirm
set title
set noswapfile
set nobackup
set noundofile
set nowrap
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildmenu

let mapleader="\<space>"

nnoremap <leader>gd :YcmCompleter GoTo<cr>
nnoremap <leader>cf :tabedit ~/.vimrc<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit<cr>
nnoremap <silent> <tab> :tabnext<cr>
nnoremap <silent> <S-tab> :tabprevious<cr>
nnoremap <c-t> :tabedit<cr>
nnoremap <c-p> :FZF <cr>
nnoremap <c-b> :NERDTreeToggle<cr>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
map <silent> <leader><cr> :noh<cr>

filetype plugin on

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdtree'

"Themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme onedark
set background=dark

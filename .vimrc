colorscheme default
set background=dark

syntax on
set laststatus=2
set hidden
set number
set relativenumber
set wildmenu
set ignorecase
set smartcase
set confirm
set title
set autoindent
set wildmenu
set wildmode=longest:full,full
set updatetime=100
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set tabstop=4       
set smarttab
set noswapfile
set nobackup
set noundofile
set incsearch
set hlsearch
set nowrap
" virtual tabstops using spaces
set shiftwidth=4
set softtabstop=4
set expandtab

let mapleader="\<space>"


nnoremap <leader>cf :vsplit ~/.vimrc<cr>
nnoremap <leader>cs :vsplit ~/.vim/snips/<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit<cr>
nnoremap <silent> <tab> :tabnext<cr>
nnoremap <silent> <S-tab> :tabprevious<cr>
nnoremap <c-t> :tabedit<cr>
nnoremap <c-o> :Explore<cr>
nnoremap <silent> <c-p> :edit **/*
map <silent> <leader><cr> :noh<cr>
nnoremap <silent> <C-l> :exe "vertical resize +10"<CR>
nnoremap <silent> <C-h> :exe "vertical resize -10"<CR>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

if !has('gui_running')
  set t_Co=256
endif
set noshowmode

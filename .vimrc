set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set nofixendofline
set title
set confirm
set number
set relativenumber
set wildmenu
set background=dark

let mapleader=','

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <silent> <leader><space> :noh<cr>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>cf :tabedit ~/.vimrc<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <leader>1 :source ~/.vimrc \| :PlugInstall<CR>
nnoremap <leader>2 :source ~/.vimrc \| :PlugClean<CR>
nnoremap <leader>h :<C-u>split<CR>
nnoremap <leader>v :<C-u>vsplit<CR>
nnoremap <leader>e :FZF<CR>
nnoremap <F3> :Vexplore<CR>

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>f  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'

call plug#end()

let g:coc_disable_startup_warning = 1

colorscheme gruvbox

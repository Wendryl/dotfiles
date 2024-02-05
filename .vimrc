" Vim minimal configuration for web dev without plugins
set nocompatible
set relativenumber
set number
syntax on
set laststatus=2
set wildmenu
set wildmode=longest:full,full
set path+=**
set nowrap
set list
set hlsearch
set autoindent
set expandtab
set si
set scrolloff=2
set listchars=tab:▸a,trail:·
set list                    " Shows characters 
set hlsearch                " hlsearches
set ignorecase
set notermguicolors
set noswapfile

colorscheme desert

let mapleader = ","

nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap <leader>cf :edit ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>t :PhpTest<CR>

augroup FileTypeSpecificAutocommands
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

highlight ColorColumn ctermbg=darkblue
call matchadd('ColorColumn', '\%81v',100)
noremap <silent><leader><space> :nohls<CR>

command! PhpTest !php artisan test

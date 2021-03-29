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
set nowrap
set laststatus=2
set statusline=
set statusline+=
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set updatetime=600
set colorcolumn=80
set mouse=a
set autoread

autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

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
nnoremap <F3> :Lexplore<CR>

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>f  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <S-k> :m-2<CR>
nnoremap <S-j> :m+<CR>

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'tomasr/molokai'
Plug 'danilo-augusto/vim-afterglow'
Plug 'mhartington/oceanic-next'
Plug 'ap/vim-css-color'

call plug#end()

colorscheme OceanicNext

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-phpls',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-emmet',
  \ 'coc-snippets',
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

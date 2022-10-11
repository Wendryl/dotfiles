set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set softtabstop=0
set shiftwidth=2
set softtabstop=2
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
set nowrap
set laststatus=2
set statusline=
set statusline+=
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=%{expand(&filetype)}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set updatetime=300
set colorcolumn=80
set autoread
set mouse=a
set background=dark
syntax on

" " Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256

autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType blade setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 expandtab
au BufNewFile,BufRead *.blade.php set filetype=html

let mapleader=','

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Tab Navigation
nnoremap <silent> <Tab> gt<CR>
nnoremap <silent> <S-Tab> gT<CR>
nnoremap <silent> <S-t> :tabnew<CR>

" Clear selection
nnoremap <silent> <leader><space> :noh<cr>
" Save
nnoremap <Leader>w :w<CR>
" Quit
nnoremap <Leader>q :q<CR>
" Open config file
nnoremap <Leader>cf :tabedit ~/.config/nvim/init.vim<CR>
" Reload nvim
nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>
" Install plugins
nnoremap <leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
" Uninstall plugins
nnoremap <leader>2 :source ~/.config/nvim/init.vim \| :PlugClean<CR>
nnoremap <leader>h :<C-u>split<CR>
nnoremap <leader>v :<C-u>vsplit<CR>
nnoremap <leader>e <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFind<CR>
nnoremap <leader>pf :CocCommand prettier.formatFile<CR>

" Move lines up and down
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CocNvim setup

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>f  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'preservim/nerdtree'
Plug 'jwalton512/vim-blade'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'APZelos/blamer.nvim'
Plug 'pangloss/vim-javascript'
Plug 'stanangeloff/php.vim'
Plug 'leafgarland/typescript-vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" Colorschemes
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'boschni/vim-sublime256'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()

colorscheme jellybeans

let g:coc_disable_startup_warning = 0
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-phpls',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-css',
  \ ]

let g:blamer_enabled = 1

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { enable = true },
}
EOF


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

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>f  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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
Plug 'ghifarit53/tokyonight-vim'

call plug#end()

colorscheme tokyonight

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


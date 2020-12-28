colorscheme default
set background=dark

syntax on
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

let mapleader="\<space>"

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

function! TogglePaste()
    if &paste == '1'
        set nopaste
        echo "Paste mode off"
    else
        set paste
        echo "Paste mode on"
    endif
endfunc

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
nnoremap <silent> <c-a> :call ToggleMouse()<cr>
nnoremap <silent> <leader>p :call TogglePaste()<cr>
map <silent> <leader><cr> :noh<cr>
nnoremap <silent> <C-l> :exe "vertical resize +10"<CR>
nnoremap <silent> <C-h> :exe "vertical resize -10"<CR>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

set tabstop=4       
set smarttab
set noswapfile
set nobackup
set noundofile

if !has('gui_running')
  set t_Co=256
endif
set noshowmode


set incsearch
set hlsearch
set nowrap

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap < <><left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Snippets
nnoremap <leader>h :read ~/.vim/snips/html.html<CR>ggdd6jo
nnoremap <leader>dmp :read ~/.vim/snips/dump.php<CR>jf(a

" virtual tabstops using spaces
set shiftwidth=4
set softtabstop=4
set expandtab


"Status line setup
set laststatus=2
set statusline=
set statusline+=%1*
set statusline+=%6*
set statusline+=\ %{StatuslineMode()}
set statusline+=\ 
set statusline+=%1*
set statusline+=\ %{b:gitbranch}
set statusline+=%3*
set statusline+=%F
set statusline+=\ 
set statusline+=%4*
set statusline+=%m
set statusline+=%=
set statusline+=%3*
set statusline+=%5*
set statusline+=%y
set statusline+=\ 
set statusline+=%4*
set statusline+=%l
set statusline+=:
set statusline+=%c
set statusline+=\ 
set statusline+=\|
set statusline+=\ 
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\ 
hi User1 ctermbg=black ctermfg=red guibg=black guifg=red
hi User3 ctermbg=black ctermfg=lightyellow guibg=black guifg=lightyellow
hi User4 ctermbg=black ctermfg=lightblue guibg=black guifg=lightblue
hi User5 ctermbg=black ctermfg=yellow guibg=black guifg=yellow
hi User6 ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
hi User4 ctermbg=black ctermfg=lightyellow guibg=black guifg=lightyellow

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch=" (".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
"call plug#begin('~/.vim/plugged')
"call plug#end()
"Plugins

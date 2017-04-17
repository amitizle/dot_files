" execute pathogen#infect()
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'jacoborus/tender.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'elixir-lang/vim-elixir', { 'for' : 'elixir'}
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for' : 'erlang'}
Plug 'vim-erlang/vim-erlang-skeletons', { 'for' : 'erlang'}
Plug 'tpope/vim-fugitive'
Plug 'lfe/vim-lfe'
Plug 'vim-ruby/vim-ruby', { 'for' : 'ruby'}
Plug 'vitalk/vim-simple-todo'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
call plug#end()

set shell=/usr/local/bin/zsh

set history=700
set ruler
set number
filetype plugin on
filetype indent on

let mapleader = ","

" Set to auto read when a file is changed from the outside
set autoread

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/

set wildmenu
set cmdheight=2
set smartcase
set hlsearch
set incsearch
set showmatch
syntax enable
set background=dark
colorscheme solarized
hi Visual term=reverse cterm=reverse guibg=Grey
" hi Search guibg=White guifg=White ctermbg=Gray ctermfg=Black
set encoding=utf8
set ffs=unix,dos,mac
set noswapfile

" Spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set backspace=2

set laststatus=2
"Format status bar
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ \ \ \ \ \ \ \ \ \ \ Line:\ %l\ %c\ %y\ %P

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%F\                          " file name full path
set statusline+=\|                          " file name full path
set statusline+=Type:\ %{strlen(&ft)?&ft:'none'}  " filetype
set statusline+=\|                          " file name full path
set statusline+=%=                           " right align
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set t_Co=256

" Added for trailing spaces:
set wrap
set linebreak
set showbreak=>\ \ \
" Remove trailing spaces on save (w)
autocmd BufWritePre * :%s/\s\+$//e

"Ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType erlang setlocal shiftwidth=2 tabstop=2
autocmd FileType erlang setlocal shiftwidth=4 tabstop=4
au BufRead,BufNewFile *.wiki setfiletype dokuwiki
au BufRead,BufNewFile *.config.script setfiletype erlang
au BufRead,BufNewFile *.config setfiletype erlang
au BufRead,BufNewFile *.app setfiletype erlang
au BufRead,BufNewFile *.app.src setfiletype erlang
au BufRead,BufNewFile *.app.src.script setfiletype erlang
au BufRead,BufNewFile *.xrl setfiletype erlang
au BufRead,BufNewFile *.yrl setfiletype erlang

" Elixir file types
au BufRead,BufNewFile *.ex setfiletype elixir
au BufRead,BufNewFile *.exs setfiletype elixir

map <C-n> :NERDTreeToggle<CR>


" Set Erlang project files to be erlang
au BufNewFile,BufRead rebar.config            setf erlang
au BufNewFile,BufRead rebar.config.script     setf erlang
au BufNewFile,BufRead *.app.src               setf erlang


set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" Slime (Lisp)
let g:slime_target = "tmux"
let g:slime_paste_file = "~/.slimepaste"

" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Color right margin'd words
" highlight rightMargin ctermfg=lightblue
" match rightMargin /.\%>79v/

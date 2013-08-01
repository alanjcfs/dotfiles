" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"set colorcolumn=86
"set cursorline
set encoding=utf-8
set expandtab	"Expand tabs into spaces
set gcr=n:blinkon0
"set gdefault
"set hidden
"set hlsearch
set ignorecase
"set incsearch
"set laststatus=2
set list	"List end of line
"set number	"Number each line in the file
"set relativenumber
"set ruler
set scrolloff=3	"keep a minimum number of lines above and below cursor
set shiftround	"When using >> or << will round to shiftwidth
set shiftwidth=2	"Use two spaces when using >> or <<
"set showcmd
"set showmatch
"set showmode
set smartcase
set smarttab
set tabstop=2	"Use two spaces instead of 8
"set ttyfast
"set visualbell
"set wildmenu
"set wildmode=list:longest
set wrap
set textwidth=80

set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile
"set shell=$SHELL\ -l

" Mapleader is backslash by default, but changing it to comma
let mapleader=","
let maplocalleader="\\" "Leave local leader at backslash
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>l :ls<cr>:b<space>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>n :NERDTree<cr>
nnoremap <leader>t :CtrlP<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" C-D delete line and insert
inoremap <c-d> <esc>ddi
" C-U UPCASE
inoremap <c-u> <esc>viwUA

inoremap jk <esc>
augroup local_leader
  autocmd!
  autocmd FileType vim,gitconfig set noexpandtab|set tabstop=8
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType ruby nnoremap <buffer> <localleader>c I#<esc>
augroup END

" Corrections and expansions
iabbrev @@    alan@atomsign.net
iabbrev adn and
abbrev ccopy  Copyright 2013 Alan Fung-Schwarz, all rights reserved.

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Alphabetized Vundles
Bundle 'derekwyatt/vim-scala'
Bundle 'flazz/vim-colorschemes'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'wting/rust.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'msanders/snipmate.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'slim-template/vim-slim'
Bundle 'sunaku/vim-ruby-minitest'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'wting/rust.vim'
Bundle 'flazz/vim-colorschemes'
"Bundle 'Floobits/floobits-vim'
" Bundle 'tpope/vim-bundler' "Conflicts with Vundle
Bundle 'L9'

filetype on

"execute pathogen#infect()
"call pathogen#helptags()

nnoremap <leader>g :Git<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>a :Ag<space>

" set statusline+=%{fugitive#statusline()}
set splitright
colorscheme darkblue

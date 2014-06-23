" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" "
" Mostly Filetypes
" Ordered by name of plugins stated, not username.
"
Plugin 'dagwieers/asciidoc-vim'
Plugin 'tpope/vim-bundler.git'
Plugin 'wting/rust.vim'
Plugin 'timcharper/textile.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-git'
Plugin 'fatih/vim-go'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'derekwyatt/vim-scala'
" "
" Plugins -- Ordered by name of plugins, not username.
"
" Ag		Silver Searcher
Plugin 'rking/ag.vim'
" CtrlP		Allow opening files
Plugin 'kien/ctrlp.vim'
" Gundo	Visual Undo Tree
Plugin 'sjl/gundo.vim'
" NERDtree	Directory Navigation (Alternative to Netrw)
Plugin 'scrooloose/nerdtree'
" Syntastic	Syntax Checker
Plugin 'scrooloose/syntastic'
" Tabular	Automated aligning of text
Plugin 'godlygeek/tabular'
" Tagbar	Show location of defined methods
Plugin 'majutsushi/tagbar'
" Tcomment	Use gcc to comment a line
Plugin 'tomtom/tcomment_vim'
" Endwise	Ruby auto-end
Plugin 'tpope/vim-endwise'
" Gdiff, Gwrite, Ggrep, etc.
Plugin 'tpope/vim-fugitive'
" Git		Status in gutter
Plugin 'airblade/vim-gitgutter'
" Notetaking -- these plugins go together
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
" SnipMate
" Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Surround	Surround S or change with cs
Plugin 'tpope/vim-surround'
" tbone.vim
Plugin 'tpope/vim-tbone'
" Vim-Tmux	Integration so we don't have to remember how to go left and right.
Plugin 'christoomey/vim-tmux-navigator'
" "
" Themes/Colorscheme
"
Plugin 'sjl/badwolf'
" Plugin 'altercation/vim-colors-solarized'
" Additional colors from Color Sampler Pack found in
" http://www.vim.org/scripts/script.php?script_id=625
" "
" Disabled
" Vimux and plugins
" Plugin 'benmills/vimux'
" Plugin 'pgr0ss/vimux-ruby-test'
" Not on Github
" Plugin 'L9'
" Plugin 'ScrollColors'
" Plugin 'CSApprox' " For making color schemes available on terminal, buggy
" when no colorscheme is indicated below.
" Plugin 'Floobits/floobits-vim'	" Not fully baked
" Plugin 'tpope/vim-bundler'		" Conflicts with Vundle
" Plugin 'mattn/emmet-vim'		" This is for HTML editing
call vundle#end()
" End Vundle

syntax enable
filetype plugin indent on

" Vim Built-in Plugins
runtime macros/matchit.vim

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

    autocmd FileType text,gitconfig setlocal noexpandtab tabstop=8 shiftwidth=8 textwidth=78
    autocmd FileType gitcommit setl textwidth=72
    au BufRead,BufNewFile *.md setl filetype=markdown textwidth=78
    au BufRead,BufNewFile *.adoc,*.asciidoc setl filetype=asciidoc
    au BufEnter Makefile setlocal noexpandtab tabstop=8
    au BufRead,BufNewFile *.slim setl filetype=slim
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

" set colorcolumn=86	" Set character-width column for length indicator
set cursorline		" Set underline to indicate location of cursor
set encoding=utf-8
set ignorecase		" When searching, ignore case
set smartcase		"When searching, pay attention to case when capital letter is used.
set number		" Number line in the file, show current line number
set relativenumber	" Show number of lines relative to current line
set scrolloff=3		" Keep a minimum number of lines above and below cursor
set showmatch		" When typing the closing bracket, will highlight it
set lazyredraw	" When running a script.

" Indentation settings
set shiftround		" When using >> or << will round to shiftwidth
set shiftwidth=2	" Use two spaces when using >> or <<
set expandtab		" Expand tabs into spaces
set tabstop=2		" Use two spaces instead of 8

" set ttyfast
" set visualbell
set wildmenu		" Show possible expansions above the command line
set wildmode=list:longest,full
set wildignore+=*/tmp/*
set wrap
set textwidth=78

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile
set shell=$SHELL\ -l

" Corrections and expansions
iabbrev @@    alan@atomsign.net
iabbrev adn and
iabbrev teh the
abbrev ccopy  Copyright 2013 Alan Fung-Schwarz, all rights reserved.

let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(tags)$',
	\ 'file': '\.\(exe\|png\|psd\)$',
	\ }

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
nnoremap <leader>l :ls<cr>:b<space>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>n :NERDTree<cr>
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>b :TagbarToggle<cr>
nnoremap <leader>g :Git<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>a :Ag<space>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>u :GundoToggle<cr>

" C-D delete line and insert
inoremap <c-d> <esc>ddi
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" C-U UPCASE
"inoremap <c-u> <esc>viwUA

" set statusline=%f%M\ %{fugitive#statusline()}
set statusline=%<%f%m\ %h%r%=%-14.(%l,%c%V%)\ %P
set splitright splitbelow
set clipboard^=unnamed,unnamedplus
set listchars=tab:»·,trail:·,nbsp:_
set list
set hidden

" let g:enable_numbers = 0

" colorscheme bluegreen
" colorscheme vividchalk
colorscheme badwolf
" set background=dark
" let g:solarized_termcolors=256
" colorscheme candy

if filereadable(glob('$HA_ROOT/vimrc.local'))
  source $HA_ROOT/vimrc.local
endif

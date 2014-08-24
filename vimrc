" Inspirations
" Bram Moolenaar's example vimrc and
" URL: http://vim.wikia.com/wiki/Example_vimrc

" If starting in simple editing mode, use <C-o>:q to quit.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set up Vundle/Plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" ------------------------------------------------
" Mostly Filetypes
"
Plugin 'dagwieers/asciidoc-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'slim-template/vim-slim'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'timcharper/textile.vim'
Plugin 'tpope/vim-bundler.git'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wting/rust.vim'

" Disabled
" Plugin 'fatih/vim-go'

" ------------------------------------------------
" Plugins -- Ordered by name of plugins, not username.
"
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter' " Git		Status in gutter
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'godlygeek/tabular' " Tabular	Automated aligning of text
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim' " CtrlP		Allow opening files
Plugin 'majutsushi/tagbar' " Tagbar	Show location of defined methods
Plugin 'mattn/emmet-vim' " Emmet Vim
Plugin 'rking/ag.vim' " Ag		Silver Searcher
Plugin 'scrooloose/nerdtree' " NERDtree	Directory Navigation (Alternative to Netrw)
Plugin 'scrooloose/syntastic' " Syntastic	Syntax Checker
Plugin 'sjl/gundo.vim' " Gundo	Visual Undo Tree
Plugin 'tomtom/tcomment_vim' " Tcomment	Use gcc to comment a line
Plugin 'tpope/vim-endwise' " Endwise	Ruby auto-end
Plugin 'tpope/vim-fugitive' " Gdiff, Gwrite, Ggrep, etc.
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-tbone'
Plugin 'xolox/vim-misc' " Notetaking -- these plugins go together
Plugin 'xolox/vim-notes'

" ------------------------------------------------
" Themes/Colorscheme
"
" Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'

" Plugin 'altercation/vim-colors-solarized'
" Additional colors from Color Sampler Pack found in
" http://www.vim.org/scripts/script.php?script_id=625
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

" End Vundle
call vundle#end()

filetype plugin indent on
syntax on

" Vim Built-in Plugins
runtime macros/matchit.vim

" Easier file switching in the same editor window
set hidden

" Better command-line completion
" Show possible expansions above the command line
set wildmenu
set wildmode=list:longest,full
set wildignore+=*/tmp/*

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Disable modeline because it has been a source of security vulnerabilities.
" Alternative is to use securemodelines script. Default on
" set nomodeline

" ------------------------------------------------
" Usability Options

" Use case insensitive search, except when using capital letters
set ignorecase		" When searching, ignore case
set smartcase		"When searching, pay attention to case when capital letter is used.

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" When using <C-F> and similar motions, gg, "d", "<<" and ">>", Vim by default
" go to the start of line. Set it off so it will stay in the same column when
" possible, which will be similar to other editors.
set nostartofline

" show the cursor position on last line of screen or in status line of window.
set ruler

" Always display the status line even if you have only one window.
set laststatus=2

" Instead of failing a command because of unsaved changes, raise a dialogue
" requesting to save the changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong.
set visualbell

" Reset the terminal code for the visual bell, otherwise when doing something
" wrong, the cursor flashes.
" set t_vb=

" In many terminal emulators the mouse works just fine, thus enable it.
" Enable for all modes.
set mouse=a

" Set the command window height to 2 lines to avoid many cases of having to
" press <Enter> to continue
" set cmdheight=2

" Display line numbers on the left
set number		" Number line in the file, show current line number
" Display relative line number
set relativenumber	" Show number of lines relative to current line

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Indentation options
" set shiftround		" When using >> or << will round to shiftwidth
set shiftwidth=2
set expandtab

" Indentation settings for using hard tabs, display tabs as 2 characters wide.
" set shiftwidth=2
" set tabstop=2

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" keep 50 lines of command line history, default is 20
set history=50

" Do incremental searching rather than waiting for whole word
set incsearch

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" set colorcolumn=86	" Set character-width column for length indicator
set cursorline		" Set underline to indicate location of cursor
set encoding=utf-8
set scrolloff=3		" Keep a minimum number of lines above and below cursor
set showmatch		" When typing the closing bracket, will highlight it
set lazyredraw	" When running a script.

" set ttyfast
set wrap
set textwidth=78

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile
set shell=$SHELL\ -l

" set statusline=%f%M\ %{fugitive#statusline()}
set statusline=%<%f%m\ %h%r%=%-14.(%l,%c%V%)\ %P
set splitright splitbelow
set clipboard^=unnamed,unnamedplus
set listchars=tab:»·,trail:·,nbsp:_
set list

" let g:enable_numbers = 0
" let g:solarized_termcolors=256
" colorscheme bluegreen
" colorscheme vividchalk
try
  set background=dark
  colorscheme solarized
catch
  echo("colorscheme not found")
endtry

" set background=dark
" colorscheme candy
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(tags)$',
	\ 'file': '\.\(exe\|png\|psd\)$',
	\ }
" Disable vim-go passing fmt through Go file
" let g:go_fmt_autosave = 0

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

    au FileType text,gitconfig setlocal noexpandtab tabstop=8 shiftwidth=8 textwidth=78
    au FileType gitcommit setl textwidth=72
    au Filetype go setl tabstop=4 shiftwidth=4
    au BufRead,BufNewFile *.md setl filetype=markdown textwidth=78
    au BufRead,BufNewFile *.adoc,*.asciidoc setl filetype=asciidoc
    au BufEnter Makefile setlocal noexpandtab tabstop=8
    au BufRead,BufNewFile *.slim setl filetype=slim
  augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Corrections and expansions
iabbrev @@    alan@atomsign.net
iabbrev adn and
iabbrev teh the
abbrev ccopy  Copyright 2013 Alan Fung-Schwarz, all rights reserved.

" ------------------------------------------------
" Mappings

" Map Y to act like D and C, to yank from cursor to EOL rather than yy.
map Y y$

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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

nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

if filereadable(glob('$HA_ROOT/vimrc.local'))
  source $HA_ROOT/vimrc.local
endif

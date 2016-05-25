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
filetype off

call plug#begin('~/.vim/bundle')
" ------------------------------------------------
" Mostly Filetypes
Plug 'dagwieers/asciidoc-vim', { 'for': 'asciidoc' }
Plug 'sunaku/vim-ruby-minitest', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rake'

" ------------------------------------------------
" Plugins -- Ordered by name of plugins, not username.
Plug 'airblade/vim-gitgutter' " Git		Status in gutter
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular' " Tabular	Automated aligning of text
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'Shougo/vimshell.vim'
Plug 'ctrlpvim/ctrlp.vim' " CtrlP		Allow opening files
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' } " Tagbar	Show location of defined methods
Plug 'mattn/emmet-vim' " Emmet Vim
Plug 'rking/ag.vim', { 'on': 'Ag' } " Ag		Silver Searcher
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " NERDtree	Directory Navigation (Alternative to Netrw)
Plug 'scrooloose/syntastic' " Syntastic	Syntax Checker
Plug 'sheerun/vim-polyglot' " One vim to rule them all
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' } " Gundo	Visual Undo Tree
Plug 'tacahiroy/ctrlp-funky'
Plug 'tomtom/tcomment_vim' " Tcomment	Use gcc to comment a line
Plug 'tpope/vim-endwise' " Endwise	Ruby auto-end
Plug 'tpope/vim-fugitive' " Gdiff, Gwrite, Ggrep, etc.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone' " Tmux integration
Plug 'tpope/vim-unimpaired'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" ------------------------------------------------
" Themes/Colorscheme
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
call plug#end()

filetype plugin indent on
syntax enable

runtime macros/matchit.vim " Vim Built-in Plugins

set hidden                     " Easier file switching in the same editor window
set wildmenu                   " Better command-line completion
set wildmode=list:longest,full " Show possible expansions above the command line
set wildignore+=*/tmp/*
set showcmd                    " Show partial commands in the last line of the screen
set hlsearch                   " Highlight searches
set modelines=0                " Ignore modelines due to security vulnerabilities
set ignorecase                 " When searching, ignore case
set smartcase                  " When searching, pay attention to case when capital letter is used.
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action
set autoindent
set nostartofline " When motions, Vim by default go to start of line. This disables it
set ruler         " show the cursor position on last line of screen or in status line of window.
set laststatus=2  " Always display the status line even if you have only one window.
set confirm       " Request to save unsaved files when quitting
set visualbell    " Don't beep
set mouse=a
set number            " Number line in the file, show current line number
set norelativenumber  " Show number of lines relative to current line
set pastetoggle=<F11> " Use <F11> to toggle between 'paste' and 'nopaste'
set noshiftround      " When using >> or << will round to shiftwidth
set shiftwidth=2
set expandtab " Expand tabs to spaces
set tabstop=8 " Display real tab as 8 characters wide
set softtabstop=4
set history=50 " keep 50 lines of command line history
set nogdefault
set incsearch  " Do incremental search
" set colorcolumn=80	" Set character-width column for length indicator
set nocursorline		" Set underline to indicate location of cursor
set encoding=utf-8
set scrolloff=3		" Keep a minimum number of lines above and below cursor
set showmatch		" Show matching bracket
set lazyredraw	" When running a script.
set ttyfast
set wrap
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//
set undofile
set shell=$SHELL\ -l
set statusline=%<%f%m\ %h%r%=%-14.(%l,%c%V%)\ %P
set splitright splitbelow
set clipboard^=unnamed,unnamedplus
set list
set listchars=tab:»·,trail:·,nbsp:+
set synmaxcol=200
set showmode

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Quickly time out on keycodes, but never time out on mappings
" NOTE: Causes NeoVim to insert special characters when using the ESC key.
" set notimeout ttimeout ttimeoutlen=200

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

"" Neocomplete config """""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 0
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
" let g:neocomplete#sources#dictionary#dictionaries = {
"       \ 'default':'',
"       \ 'vimshell':$HOME.'/.vimshell_hist',
"       \ 'scheme':$HOME.'/.gosh_completions'
"       \ }
" if !exists('g:neocomplete#keyword_patterns')
"   let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" inoremap <expr><C-g> neocomplete#undo_completion()
" inoremap <expr><C-l> neocomplete#complete_common_string()
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" endfunction
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" End Neocomplete config """"""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checks = ['jshint']
let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:enable_numbers = 0
" let g:solarized_termcolors=256

" CtrlP Config
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](node_modules|target|dist)',
      \ 'file': '\v\.(exe|png|jpg|gif|psd|pdf|map)$',
      \ 'link': '',
      \ }
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp' " Set up caching.
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }

" Vim-Go config (Disabled)
" Disable vim-go passing fmt through Go file
" let g:go_fmt_autosave = 0

" GitGutter config
" Disable using gitgutter on switching buffer
let g:gitgutter_eager = 0

" UltiSnips config
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-f>"
let g:UltiSnipsJumpBackwardTrigger = "<C-b>"

let g:polyglot_disabled = []

" Easytags
let g:easytags_async = 1

try
  set background=dark " dark | light "
  silent! colorscheme solarized
endtry
""""""""""""""""""""""""""""""""""""""""""""""""""

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

    au FileType text,gitconfig setlocal noexpandtab tabstop=8 shiftwidth=8 textwidth=80
    au FileType gitcommit setl textwidth=72
    au Filetype go setl tabstop=4 shiftwidth=4
    au FileType markdown setl textwidth=80 omnifunc=htmlcomplete#CompleteTags
    au BufRead,BufNewFile *.md,*.markdown setl filetype=markdown
    au BufRead,BufNewFile *.adoc,*.asciidoc setl syntax=asciidoc textwidth=80
    au BufRead,BufNewFile *.es6 setl filetype=javascript
    au BufEnter Makefile setlocal noexpandtab tabstop=8 shiftwidth=8
    au FileType html setl noexpandtab tabstop=4 shiftwidth=4 omnifunc=htmlcomplete#CompleteTags listchars-=tab:»·
    au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType ruby setl omnifunc=rubycomplete#Complete
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags
    " au BufRead,BufEnter ~/Tuna/* setl tabstop=2 shiftwidth=2
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

" Escape using jk
inoremap jk <esc>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key mappings
" CtrlP
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>fu :CtrlPFunky<cr>
nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<cr>

" Plugins
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :TagbarToggle<cr>
nnoremap <leader>n :NERDTree<cr>
nnoremap <leader>u :GundoToggle<cr>
nnoremap <leader>co :NeoCompleteToggle<cr>

" Vim customizations
nnoremap <leader><space> :noh<cr>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>l :ls<cr>:b<space>

" Git
nnoremap <leader>g :Git<space>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit -v<cr>
nnoremap <leader>gd :Gdiff<space>
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gp :!git log -p %<cr>

nnoremap <leader>rc :!rubocop %<cr>
nnoremap <leader>t :!ruby<space>%<cr>
" End Leader key mappings """"""""""""""""""""""""

" ???
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Search using Perl/Python-compatible regex
nnoremap / /\v
vnoremap / /\v

" Source other local vimrc files, if any
" if filereadable(glob('$HA_ROOT/vimrc.local'))
"   source $HA_ROOT/vimrc.local
" endif

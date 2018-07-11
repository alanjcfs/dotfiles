call plug#begin()
" Themes & Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'quanganhdo/grb256'
Plug 'ajh17/Spacegray.vim'
Plug 'junegunn/seoul256.vim'

" Fuzzysearch & Autocomplete
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': 'CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh' }
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim'

" Syntax
Plug 'avh4/elm-format', { 'for': 'elm'}
Plug 'elmcast/elm-vim', { 'for': 'elm'}
Plug 'asciidoc/vim-asciidoc', { 'for': ['asciidoc'] }
Plug 'mattn/emmet-vim'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'

" Writing
Plug 'reedes/vim-pencil', { 'for': ['markdown', 'asciidoc'] }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }

" Plug 'vim-airline/vim-airline'

" Code Editing
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tomtom/tcomment_vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" Ruby
Plug 'sunaku/vim-ruby-minitest'

" Miscellaneous
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'



" The prolific Mr. T. Pope
" Plug 'tpope/sleuth.vim' " File-based indentation
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'


" VimScripts
Plug 'vim-scripts/greplace.vim'

call plug#end()



" Mouse behaviors
set mouse=a



set clipboard^=unnamed
set colorcolumn=80 cursorline
set confirm
set expandtab noshiftround shiftwidth=2 smarttab softtabstop=2 tabstop=4
set hidden
set ignorecase smartcase
set list listchars+=tab:»·,trail:·,nbsp:+,extends:>,precedes:<
set modelines=0
set number norelativenumber
" NOTE: Practice using H, M, and L to reach top, middle, and bottom of screen
set scrolloff=1 " sidescrolloff=5
set sidescroll=1
" set splitright splitbelow
set startofline!
set undofile
set visualbell



" Folding
set foldenable foldlevelstart=10 foldnestmax=10 foldmethod=indent



" Shells
set shell=$SHELL\ -l



if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim " Vim Built-in Plugins
endif



""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line with syntastic settings
" set statusline=%<%f%m\ %h%r%=%-14.(%l,%c%V%)\ %P " What does this line do‽ ಠ_ಠ
if exists('g:loaded_fugitive')
  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
else
  set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
endif
set statusline+=%#warningmsg#
if exists('g:loaded_syntastic_checker')
  set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }
""""""""""""""""""""""""""""""""""""""""""""""""""



" Racer completer

let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

let g:ackprg = 'rg --vimgrep --smart-case'



" CtrlP Config

let g:ctrlp_custom_ignore =
      \ { 'dir': '\m\C/(node_modules|target|dist)'
      \ , 'file': '\m\C\.(exe|png|jpg|gif|psd|pdf|map)$'
      \ , 'link': ''
      \ }



" Ack/RipGrep

if executable('rg')
  let g:ctrlp_user_command = 'rg %s -l --files --color=never --glob ""'
                          "  'rg %s -l --files ""'
endif
" let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }



" GitGutter config

let g:gitgutter_eager = 0 " GitGutterCustomisation



" Elm Format

let g:elm_format_autosave = 1



" Polyglot
let g:polyglot_disabled = ['elm']



" Ultisnips

let g:UltiSnipsExpandTrigger = "<C-E>"



" YCM

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers = {
      \ 'elm' : ['.'],
      \ }



"AutoPairs
" Disable abruptly centering the current line when pressing <cr>
let g:AutoPairsCenterLine = 0



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
" map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Escape using jk
inoremap jk <esc>

" Plugins
nnoremap <leader>a :Ack!<space>
nnoremap <leader>b :TagbarToggle<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>u :GundoToggle<cr>
nnoremap <leader>d :Dispatch<space><up>

" Vim customizations
nnoremap <leader><space> :noh<cr>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>ev :split $HOME/.files/vim.d/main.vim<cr>
nnoremap <leader>fv :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>l :ls<cr>:b<space>
nnoremap <leader>z :FZF<cr>

" Git
nnoremap <leader>g :Git<space>
nnoremap <leader>gb :Gblame<space>
nnoremap <leader>gc :Gcommit -v<space>
nnoremap <leader>gd :Gdiff<space>
nnoremap <leader>gl :Glog -p<space>
nnoremap <leader>gw :Gwrite<cr>

" Move lines
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>==
xnoremap <leader>j :m'>+<cr>gv=gv
xnoremap <leader>k :m-2<cr>gv=gv

nnoremap <leader>rc :!rubocop %<cr>
" End Leader key mappings """"""""""""""""""""""""

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)



" Colorscheme

try
  set background=dark
  let g:seoul256_background = 233
  silent! colorscheme seoul256
endtry
""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:set ft=vim et sw=2


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

    au BufEnter Makefile setlocal noexpandtab tabstop=8 shiftwidth=8

    " Filetype
    au BufRead,BufNewFile *.md,*.markdown setl filetype=markdown
    au BufRead,BufNewFile *.adoc,*.asciidoc setl filetype=asciidoc textwidth=80
    au BufRead,BufNewFile *.ldgr setl noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
    au BufRead,BufNewFile *.es6 setl filetype=javascript

    " Text
    au FileType gitcommit setl textwidth=72
    au FileType gitconfig setl noexpandtab tabstop=8 shiftwidth=8 textwidth=80
    au FileType markdown setl textwidth=80 omnifunc=htmlcomplete#CompleteTags
    au FileType text setl noexpandtab tabstop=8 shiftwidth=8 textwidth=80
    au FileType asciidoc call pencil#init({'autoformat': 0}) | setl textwidth=80

    " Code
    au FileType css setl omnifunc=csscomplete#CompleteCSS
    au FileType elm setl tabstop=4 shiftwidth=4 softtabstop=4
    au FileType html setl noexpandtab softtabstop=4 tabstop=4 shiftwidth=4
          \ omnifunc=htmlcomplete#CompleteTags listchars-=tab:»·
    au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType ruby setl omnifunc=rubycomplete#Complete | set re=1
    au FileType rust setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType sh setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags noexpandtab tabstop=8 shiftwidth=8

    " au BufRead,BufEnter ~/Tuna/* setl tabstop=2 shiftwidth=2
  augroup END
endif " has("autocmd")

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
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }




" Syntax
" Plug 'scrooloose/syntastic'
Plug 'avh4/elm-format', { 'for': 'elm'}
Plug 'elmcast/elm-vim', { 'for': 'elm'}
Plug 'asciidoc/vim-asciidoc', { 'for': ['asciidoc'] }
Plug 'ledger/vim-ledger', { 'for': 'ledger' }
Plug 'mattn/emmet-vim'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'dense-analysis/ale'
" Plug 'skywind3000/asyncrun.vim'

" JS Syntax
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " Unfixed issue with backticks
" Plug 'othree/yajs.vim'
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascriptreact' } " Already embedded in vim-polyglot

" Polyglot
Plug 'sheerun/vim-polyglot'

" Writing
Plug 'reedes/vim-pencil', { 'for': ['markdown', 'asciidoc'] }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }

Plug 'vim-airline/vim-airline'

" Code Editing
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
" Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

" Git
Plug 'jreybert/vimagit', { 'on': 'Magit' }

" Ruby
" Plug 'sunaku/vim-ruby-minitest'

" Miscellaneous
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'



" The prolific Mr. T. Pope
Plug 'tpope/vim-dispatch', { 'on': 'Dispatch' }
Plug 'tpope/vim-endwise' " end structures automatically
Plug 'tpope/vim-fugitive' " Git wrapper :Gwrite, :Gcommit, :Gblame, etc.
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth' " adjust shiftwidth/expandtab heuristically
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone' " tmux
Plug 'tpope/vim-unimpaired' " brackets
" Plug 'tpope/vim-vinegar' " for netrw toggling


" VimScripts
Plug 'vim-scripts/greplace.vim'

call plug#end()

" Mouse behaviors
set mouse=a


" The following can make redrawing slower
" set colorcolumn=80
" set cursorline

set clipboard^=unnamed
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
" NOTE: zsh with login causes slower tmux navigation because a new shell is
" started, but we need the login shell for startup scripts.
" set shell=$SHELL\ -l



if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim " Vim Built-in Plugins
endif



""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line with syntastic settings
" set statusline=%<%f%m\ %h%r%=%-14.(%l,%c%V%)\ %P " What does this line do‽ ಠ_ಠ
" if exists('g:loaded_fugitive')
"   set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" else
"   set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" endif
" set statusline+=%#warningmsg#
" if exists('g:loaded_syntastic_checker')
"   set statusline+=%{SyntasticStatuslineFlag()}
" endif
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }
""""""""""""""""""""""""""""""""""""""""""""""""""



" ale linter
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
      \ }
let g:airline#extensions#ale#enabled = 1


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

" let g:elm_format_autosave = 1



" Polyglot
let g:polyglot_disabled = ['jsx']



" Ultisnips

" let g:UltiSnipsExpandTrigger = "<C-j>"



"AutoPairs
" Disable abruptly centering the current line when pressing <cr>
let g:AutoPairsCenterLine = 0


" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue',
      \ ]
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
      \ 'tern#Complete',
      \ ]
" inoremap <silent> <cr> <c-r>=<SID>popup_close_and_newline()<cr>
" function! s:popup_close_and_newline() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"



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
  " let g:seoul256_background = 233
  " silent! colorscheme badwolf
  let g:solarized_termcolors=256
  silent! colorscheme solarized
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
    au BufRead,BufNewFile *.ldgr,*.ledger setl noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

    " Text
    au FileType gitcommit setl textwidth=72
    au FileType gitconfig setl noexpandtab tabstop=8 shiftwidth=8 textwidth=80
    au FileType markdown setl textwidth=80 omnifunc=htmlcomplete#CompleteTags
    au FileType text setl noexpandtab tabstop=8 shiftwidth=8 textwidth=80
    au FileType asciidoc call pencil#init({'autoformat': 0}) | setl textwidth=80

    " Code
    au FileType css setl omnifunc=csscomplete#CompleteCSS
    au FileType elm setl tabstop=4 shiftwidth=4 softtabstop=4
    au FileType html setl noexpandtab tabstop=4 shiftwidth=4
          \ omnifunc=htmlcomplete#CompleteTags listchars-=tab:»·
    au FileType javascript,javascript.jsx setl omnifunc=javascriptcomplete#CompleteJS
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType ruby setl omnifunc=rubycomplete#Complete | set re=1
    au FileType rust setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType sh setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags noexpandtab tabstop=8 shiftwidth=8

    " au BufRead,BufEnter ~/Tuna/* setl tabstop=2 shiftwidth=2

    " autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
  augroup END
endif " has("autocmd")

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Variables to set before starting up plugins
"

"
" Polyglot
let g:polyglot_disabled = ['jsx']

" Python3 host prog for faster startup
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" Disable Language Server Protocol to avoid conflict with CoC
let g:ale_disable_lsp = 1


call plug#begin()
" Themes & Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'quanganhdo/grb256'
Plug 'ajh17/Spacegray.vim'
Plug 'junegunn/seoul256.vim'

" Fuzzysearch & Autocomplete
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher', { 'do': 'pip3 install neovim' }
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }


""
" Deoplete plugins:
"
" disable because of errors raised:
" Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': 'javascript' }




" Syntax checking
" Plug 'scrooloose/syntastic' " Ale and Syntastic do similar things
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-snippets'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'fatih/vim-go'

Plug 'asciidoc/vim-asciidoc', { 'for': ['asciidoc'] }
Plug 'mattn/emmet-vim'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'chrisbra/csv.vim'

Plug 'skywind3000/asyncrun.vim'

" JS Syntax
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty' " Already embedded in vim-polyglot

" Polyglot
Plug 'sheerun/vim-polyglot'

" Writing
" Plug 'reedes/vim-pencil', { 'for': ['markdown', 'asciidoc'] }
" Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }

" Plug 'vim-airline/vim-airline'

" Code Editing
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'mbbill/undotree'
Plug 'tomtom/tcomment_vim'

" Git
Plug 'jreybert/vimagit', { 'on': 'Magit' }

" Ruby
" Plug 'sunaku/vim-ruby-minitest', { 'for': 'ruby' }

" Miscellaneous
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'


" GitHub
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'


" The prolific Mr. T. Pope
Plug 'tpope/vim-dispatch', { 'on': 'Dispatch' }
Plug 'tpope/vim-endwise' " end structures automatically
Plug 'tpope/vim-fugitive' " Git wrapper :Gwrite, :Gcommit, :Gblame, etc.
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'tpope/vim-rake', { 'for': 'ruby' } " SNR problem
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth' " adjust shiftwidth/expandtab heuristically
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone' " tmux
Plug 'tpope/vim-unimpaired' " brackets navigation
" Plug 'tpope/vim-speeddating' " increment datetime using <C-A> and <C-X>


" VimScripts
" Plug 'vim-scripts/greplace.vim'

call plug#end()


" Mouse behaviors
set mouse=a


" The following can make redrawing slower
" set colorcolumn=80
" set cursorline

set clipboard^=unnamed
set confirm
" set expandtab noshiftround shiftwidth=2 smarttab softtabstop=2 tabstop=4
set hidden
set ignorecase smartcase
set list listchars+=tab:»·,trail:·,nbsp:+,extends:>,precedes:<
set number norelativenumber
set scrolloff=1 " sidescrolloff=5
set sidescroll=1
set splitright splitbelow
set nostartofline
set undofile

" NOTE: Practice using H, M, and L to reach top, middle, and bottom of screen
" NOTE: Practice using C-D and C-U to navigate by half pages


" sign column to avoid text shifting left and right
set signcolumn=yes


" Folding
set foldenable foldlevelstart=10 foldnestmax=10 foldmethod=indent

" vim-autoformat
" let g:formatters_javascript = ['eslint_local']
let g:formatters_javascriptreact = ['eslint_local']




" ale linter
" NOTE: ALE recommends using ftplugin file instead of setting globally. Look
" into using ~/.vim/ftplugin/javascript.vim and add b:ale_fixers
" let g:ale_linters = {
"       \ 'javascript': ['eslint'],
"       \ 'javascriptreact': ['eslint'],
"       \ }
" let g:airline#extensions#ale#enabled = 1
" let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'
" let g:airline_section_b = ''
set omnifunc=ale#completion#OmniFunc
let g:ale_fix_on_save = 1



" EditorConfig exclude patterns
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']



" delimitMate settings
let delimitMate_expand_cr = 2



" Racer completer

let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" CtrlP Config

let g:ctrlp_custom_ignore =
      \ { 'dir': '\m\C/(node_modules|target|dist)'
      \ , 'file': '\m\C\.(exe|png|jpg|gif|psd|pdf|map)$'
      \ , 'link': ''
      \ }


" GitGutter config

let g:gitgutter_eager = 0 " GitGutterCustomisation



" Elm Format

" let g:elm_format_autosave = 1



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

noremap <F3> :Autoformat<CR>

" Plugins
nnoremap <leader>d :Dispatch<space><up>
nnoremap <leader>t :ALEDetail<cr>

" Vim customizations
nnoremap <leader><space> :noh<cr>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>ev :split $HOME/.files/vim.d/init.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>l :ls<cr>:b<space>
nnoremap <leader>z :FZF<cr>

" Git vim-fugitive
nnoremap <leader>g :Git<space>
nnoremap <leader>gb :Git blame<space>
nnoremap <leader>gc :Gcommit -v<space>
nnoremap <leader>gd :Gdiff<space>
nnoremap <leader>gl :Gclog -p<space>
nnoremap <leader>gw :Gwrite<cr>

" Move lines
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>==
xnoremap <leader>j :m'>+<cr>gv=gv
xnoremap <leader>k :m-2<cr>gv=gv

" End Leader key mappings """"""""""""""""""""""""

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)



" Colorscheme

try
  set background=dark
  " let g:seoul256_background = 233
  silent! colorscheme badwolf
  " let g:solarized_termcolors=256
  " silent! colorscheme solarized
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
    au BufRead,BufNewFile *.adoc,*.asciidoc setl filetype=asciidoc textwidth=120
    au BufRead,BufNewFile *.ledger setl tabstop=4 shiftwidth=4 softtabstop=4

    " Text
    au FileType gitcommit setl textwidth=72
    au FileType gitconfig setl noexpandtab tabstop=8 shiftwidth=8
    au FileType markdown setl textwidth=120
    au FileType text setl noexpandtab tabstop=8 shiftwidth=8 textwidth=120
    au FileType asciidoc call pencil#init({'autoformat': 0}) | setl textwidth=120

    " Code
    " au FileType css setl omnifunc=csscomplete#CompleteCSS
    au FileType elm setl tabstop=4 shiftwidth=4 softtabstop=4
    " au FileType html setl noexpandtab tabstop=4 shiftwidth=4
    "       \ omnifunc=htmlcomplete#CompleteTags listchars-=tab:»·
    au FileType javascript,javascript.jsx,javascriptreact setl tw=120
    " au FileType python setl omnifunc=pythoncomplete#Complete
    " au FileType ruby setl omnifunc=rubycomplete#Complete | set re=1
    au FileType rust setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType sh setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType xml setl noexpandtab tabstop=8 shiftwidth=8

    au BufWrite ruby,javascript,vue :Autoformat

    " au BufRead,BufEnter ~/Tuna/* setl tabstop=2 shiftwidth=2

    " autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
  augroup END
endif " has("autocmd")

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

if has('nvim')
  luafile <sfile>:h/lua/localmodule.lua
endif
" command! -nargs=* -complete=file Ack call luaeval("require('lua/ack/init').Ack(_A)", [<q-args>])

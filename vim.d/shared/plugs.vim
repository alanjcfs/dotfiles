call plug#begin()
" Themes & Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'quanganhdo/grb256'
Plug 'ajh17/Spacegray.vim'

" Fuzzysearch & Autocomplete
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': 'CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh' }
Plug 'mileszs/ack.vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --racer-completer' } " <tab> doesn't work
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Syntax
Plug 'avh4/elm-format', { 'for': 'elm'}
Plug 'elmcast/elm-vim', { 'for': 'elm'}
Plug 'dagwieers/asciidoc-vim', { 'for': ['asciidoc', 'txt'] }
Plug 'mattn/emmet-vim'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'

" Writing
Plug 'reedes/vim-pencil', { 'for': ['markdown', 'asciidoc'] }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
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
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'


" VimScripts
Plug 'vim-scripts/greplace.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
else
  Plug 'Shougo/neocomplete.vim'
endif

call plug#end()

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
Plug 'reedes/vim-pencil', { 'for': 'markdown' }
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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" Git
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" Ruby
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'

" Miscellaneous
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'tpope/sleuth.vim' " File-based indentation
Plug 'tpope/vim-dispatch'

" VimScripts
Plug 'vim-scripts/greplace.vim'

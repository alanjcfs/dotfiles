call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'github/copilot.vim'

" Themes & Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'quanganhdo/grb256'
Plug 'junegunn/seoul256.vim'

" Code Editing
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'

if has('nvim')
  Plug 'rcarriga/nvim-notify'
  Plug 'neovim/nvim-lspconfig'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'alanjcfs/rg.nvim'
endif " has('nvim')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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

" Writing
" Plug 'reedes/vim-pencil', { 'for': ['markdown', 'asciidoc'] }
" Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }

Plug 'itchyny/lightline.vim'

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
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-fugitive' " Git wrapper :Gwrite, :Gcommit, :Gblame, etc.
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'tpope/vim-rake', { 'for': 'ruby' } " SNR problem
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth' " adjust shiftwidth/expandtab heuristically
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone' " tmux
Plug 'tpope/vim-unimpaired' " brackets navigation

call plug#end()

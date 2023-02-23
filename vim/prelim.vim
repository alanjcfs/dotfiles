" Variables to set before starting up plugins
"

"
" Polyglot
let g:polyglot_disabled = ['jsx']

" Python3 host prog for faster startup
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" NOTE: ALE recommends using ftplugin file instead of setting globally. Look
" into using ~/.vim/ftplugin/javascript.vim and add b:ale_fixers
let g:airline#extensions#ale#enabled = 1
" let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'
" let g:airline_section_b = ''
set ofu=ale#completion#OmniFunc
let g:ale_fix_on_save = 1

let g:ale_fixers = {
      \ 'javascript': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'eslint',
      \ ],
      \}

" Disable Language Server Protocol to avoid conflict with CoC
let g:ale_disable_lsp = 1

let g:ale_exclude_highlights = ['indentation detected']

call plug#begin()
" Themes & Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'quanganhdo/grb256'
Plug 'ajh17/Spacegray.vim'
Plug 'junegunn/seoul256.vim'

" Fuzzysearch & Autocomplete
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'FelikZ/ctrlp-py-matcher', { 'do': 'pip3 install neovim' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
Plug 'alanjcfs/rg.nvim'
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

Plug 'vim-airline/vim-airline'

" Code Editing
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
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
" Plug 'tpope/vim-speeddating' " increment datetime using <C-A> and <C-X>


" VimScripts
" Plug 'vim-scripts/greplace.vim'

call plug#end()



" vim-autoformat
" let g:formatters_javascript = ['eslint_local']
let g:formatters_javascriptreact = ['eslint_local']



" EditorConfig exclude patterns
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


" delimitMate settings
let delimitMate_expand_cr = 2





try
  set background=dark
  " let g:seoul256_background = 233
  " let g:solarized_termcolors=256
  " silent! colorscheme solarized
  silent! colorscheme solarized
endtry

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

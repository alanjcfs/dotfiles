call plug#begin()
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

Plug 'rcarriga/nvim-notify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
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

" Writing
" Plug 'reedes/vim-pencil', { 'for': ['markdown', 'asciidoc'] }
" Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }

Plug 'vim-airline/vim-airline'

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

"
" Python3 host prog for faster startup
let g:python3_host_prog = '/opt/homebrew/bin/python3.10'

" NOTE: ALE recommends using ftplugin file instead of setting globally. Look
" into using ~/.vim/ftplugin/javascript.vim and add b:ale_fixers
let g:airline_disable_statusline = 0
let g:airline#extensions#ale#enabled = 1
" let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'
" let g:airline_section_b = ''
" set ofu=ale#completion#OmniFunc
let g:ale_fix_on_save = 1

let g:ale_fixers = {
      \ 'javascript': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'vue': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \}

" Disable Language Server Protocol to avoid conflict with CoC
let g:ale_disable_lsp = 1
" let g:ale_sign_column_always = 1

let g:ale_exclude_highlights = ['indentation detected']


" vim-autoformat
" let g:formatters_javascript = ['eslint_local']
let g:formatters_javascriptreact = ['eslint_local']


" EditorConfig exclude patterns
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

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
    au BufRead,BufNewFile *.jbuilder, setl filetype=ruby

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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

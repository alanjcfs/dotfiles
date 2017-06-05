" For Neovim

call plug#begin('~/.vim/bundle')
" Colorschemes
Plug 'sjl/badwolf'
Plug 'quanganhdo/grb256'

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'avh4/elm-format'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dagwieers/asciidoc-vim', { 'for': ['asciidoc', 'txt'] }
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'honza/vim-snippets'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe' " { 'do': './install.py --clang-completer --tern-completer --racer-completer' }
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
call plug#end()

set nobackup

""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left':'/**', 'right':'*/' }}
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line with syntastic settings
set statusline=%<%f%m\ %h%r%=%-14.(%l,%c%V%)\ %P " What the fuck does this line do??? ಠ_ಠ
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checks = ['jshint']
let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }
""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:enable_numbers = 0
" let g:solarized_termcolors=256

let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

let g:ackprg = 'rg --vimgrep --smart-case'

" " CtrlP Config
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](node_modules|target|dist)',
      \ 'file': '\v\.(exe|png|jpg|gif|psd|pdf|map)$',
      \ 'link': '',
      \ }
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp' " Set up caching.
if executable('rg')
  let g:ctrlp_user_command = 'rg %s -l --files ""'
endif
" let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Vim-Go config (Disabled)
" Disable vim-go passing fmt through Go file
" let g:go_fmt_autosave = 0

" GitGuttej config
" Disable using gitgutter on switching buffer
let g:gitgutter_eager = 0

" EasyTags
set tags^=.git/tags
let g:easytags_auto_highlight = 0
let g:easytags_async = 1

" Elm Format
let g:elm_format_autosave = 1

try
  set background=dark " dark | light "
  silent! colorscheme badwolf
endtry
""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Search using Perl/Python-compatible regex
" nnoremap / /\v
" vnoremap / /\v

" Plugins
nnoremap <leader>a :Ack<space>
nnoremap <leader>b :TagbarToggle<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>u :GundoToggle<cr>

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
nnoremap <leader>gl :Glog -p<cr>
nnoremap <leader>gw :Gwrite<cr>

nnoremap <leader>rc :!rubocop %<cr>
" End Leader key mappings """"""""""""""""""""""""

" ???
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Source other local vimrc files, if any
" if filereadable(glob('$ROOT/vimrc.local'))
"   source $ROOT/vimrc.local
" endif

" vim:set ft=vim et sw=2

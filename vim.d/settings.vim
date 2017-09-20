" Mouse behaviors
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line with syntastic settings
" set statusline=%<%f%m\ %h%r%=%-14.(%l,%c%V%)\ %P " What the fuck does this line do??? ಠ_ಠ
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:elm_syntastic_show_warnings = 1
let g:syntastic_javascript_checks = ['jshint']
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
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }



" GitGutter config

let g:gitgutter_eager = 0 " GitGutterCustomisation



" EasyTags

set tags+=.git/tags
" let g:easytags_auto_highlight = 0
let g:easytags_async = 1



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

" Vim customizations
nnoremap <leader><space> :noh<cr>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>l :ls<cr>:b<space>

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


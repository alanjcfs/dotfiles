" For Neovim

call plug#begin('~/.vim/bundle')
let s:plugfile = '~/.files/vim.d/plugs.vim'
if filereadable(expand(s:plugfile))
  exec "source " . s:plugfile
endif
call plug#end()



let s:sharedfile = '~/.files/vim.d/settings.vim'
if filereadable(expand(s:sharedfile))
  exec "source " . s:sharedfile
endif



let s:autocmdfile = '~/.files/vim.d/autocmds.vim'
if filereadable(expand(s:autocmdfile))
  exec "source " . s:autocmdfile
endif



set clipboard^=unnamed
set colorcolumn=80 cursorline
set confirm
set list listchars+=tab:»·,trail:·,nbsp:+,extends:>,precedes:<
set nobackup
set number
set scrolloff=3
set splitright splitbelow
set ignorecase smartcase
set expandtab noshiftround shiftwidth=2 smarttab softtabstop=2 tabstop=4



" Colorscheme

try
  set background=dark " dark | light "
  silent! colorscheme badwolf
endtry
""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:set ft=vim et sw=2

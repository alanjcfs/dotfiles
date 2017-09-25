" For Neovim

call plug#begin('~/.vim/bundle')
let s:plugfile = '~/.files/vim.d/shared/plugs.vim'
if filereadable(expand(s:plugfile))
  exec "source " . s:plugfile
endif
call plug#end()



let s:settingfile = '~/.files/vim.d/shared/settings.vim'
if filereadable(expand(s:settingfile))
  exec "source " . s:settingfile
endif



let s:autocmdfile = '~/.files/vim.d/shared/autocmds.vim'
if filereadable(expand(s:autocmdfile))
  exec "source " . s:autocmdfile
endif



set clipboard^=unnamed
set colorcolumn=80 cursorline
set confirm
set list listchars+=tab:»·,trail:·,nbsp:+,extends:>,precedes:<
set nobackup
set number
set expandtab noshiftround shiftwidth=2 smarttab softtabstop=2 tabstop=4

" For Neovim

let s:plugfile = '~/.files/vim.d/shared/plugs.vim'
if filereadable(expand(s:plugfile))
  exec "source " . s:plugfile
endif



let s:settingfile = '~/.files/vim.d/shared/settings.vim'
if filereadable(expand(s:settingfile))
  exec "source " . s:settingfile
endif



let s:autocmdfile = '~/.files/vim.d/shared/autocmds.vim'
if filereadable(expand(s:autocmdfile))
  exec "source " . s:autocmdfile
endif



let g:deoplete#enable_at_startup = 1
inoremap <silent> <cr> <c-r>=<SID>popup_close_and_newline()<cr>
function! s:popup_close_and_newline() abort
  return deoplete#close_popup() . "\<CR>"
endfunction



set clipboard^=unnamed
set colorcolumn=80 cursorline
set confirm
set list listchars+=tab:»·,trail:·,nbsp:+,extends:>,precedes:<
set nobackup
set number
set expandtab noshiftround shiftwidth=2 smarttab softtabstop=2 tabstop=4

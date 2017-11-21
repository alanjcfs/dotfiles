" For Neovim

let s:sharedfile = '~/.files/vim.d/shared.vim'
if filereadable(expand(s:sharedfile))
  exec "source " . s:sharedfile
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

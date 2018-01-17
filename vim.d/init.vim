" For Neovim

let s:mainfile = '~/.files/vim.d/main.vim'
if filereadable(expand(s:mainfile))
  exec "source " . s:mainfile
endif



let g:deoplete#enable_at_startup = 1
inoremap <silent> <cr> <c-r>=<SID>popup_close_and_newline()<cr>
function! s:popup_close_and_newline() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

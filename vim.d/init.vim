" For Neovim

let s:mainfile = '~/.files/vim.d/main.vim'
if filereadable(expand(s:mainfile))
  exec "source " . s:mainfile
endif

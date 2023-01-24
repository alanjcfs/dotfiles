call plug#begin()
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()
if has('nvim')
  luafile <sfile>:h/lua/coc-config/init.lua
endif

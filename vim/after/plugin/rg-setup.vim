command! -bang -nargs=* Rg call fzf#vim#grep("rg -u --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, <bang>0)

let g:loaded_alan_settings=1

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

    au BufEnter Makefile setlocal noexpandtab tabstop=8 shiftwidth=8

    " Filetype
    au BufRead,BufNewFile *.md,*.markdown setl filetype=markdown
    au BufRead,BufNewFile *.adoc,*.asciidoc setl syntax=asciidoc textwidth=80 | Pencil
    au BufRead,BufNewFile *.ldgr setl noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
    au BufRead,BufNewFile *.es6 setl filetype=javascript

    " Text
    au FileType gitcommit setl textwidth=72
    au FileType gitconfig setl noexpandtab tabstop=8 shiftwidth=8 textwidth=80
    au FileType markdown setl textwidth=80 omnifunc=htmlcomplete#CompleteTags
    au FileType text setl noexpandtab tabstop=8 shiftwidth=8 textwidth=80

    " Code
    au FileType css setl omnifunc=csscomplete#CompleteCSS
    au FileType elm setl tabstop=4 shiftwidth=4 softtabstop=4
    au FileType html setl noexpandtab softtabstop=4 tabstop=4 shiftwidth=4
          \ omnifunc=htmlcomplete#CompleteTags listchars-=tab:»·
    au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType ruby setl omnifunc=rubycomplete#Complete | set re=1
    au FileType rust setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType sh setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags noexpandtab tabstop=8 shiftwidth=8

    " au BufRead,BufEnter ~/Tuna/* setl tabstop=2 shiftwidth=2
  augroup END
endif " has("autocmd")

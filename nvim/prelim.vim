"
" Python3 host prog for faster startup
" let g:python3_host_prog = '/opt/homebrew/bin/python3.10'


" EditorConfig exclude patterns
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

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
    au BufRead,BufNewFile *.adoc,*.asciidoc setl filetype=asciidoc textwidth=120
    au BufRead,BufNewFile *.ledger setl tabstop=4 shiftwidth=4 softtabstop=4
    au BufRead,BufNewFile *.jbuilder, setl filetype=ruby

    " Text
    au FileType gitcommit setl textwidth=72
    au FileType gitconfig setl noexpandtab tabstop=8 shiftwidth=8
    au FileType markdown setl textwidth=120
    au FileType text setl noexpandtab tabstop=8 shiftwidth=8 textwidth=120
    " au FileType asciidoc call pencil#init({'autoformat': 0}) | setl textwidth=120

    " Code
    " au FileType css setl omnifunc=csscomplete#CompleteCSS
    au FileType elm setl tabstop=4 shiftwidth=4 softtabstop=4
    " au FileType html setl noexpandtab tabstop=4 shiftwidth=4
    "       \ omnifunc=htmlcomplete#CompleteTags listchars-=tab:»·
    au FileType javascript,javascript.jsx,javascriptreact setl tw=120
    " au FileType python setl omnifunc=pythoncomplete#Complete
    " au FileType ruby setl omnifunc=rubycomplete#Complete | set re=1
    au FileType rust setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType sh setl softtabstop=2 tabstop=4 shiftwidth=4
    au FileType xml setl noexpandtab tabstop=8 shiftwidth=8
    au FileType lua setl noexpandtab tabstop=4 shiftwidth=4

    au BufWrite ruby,javascript,vue,lua :Autoformat

    " au BufRead,BufEnter ~/Tuna/* setl tabstop=2 shiftwidth=2

    " autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
  augroup END
endif " has("autocmd")

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

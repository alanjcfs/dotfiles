local Ack = function (opts)
  if opts.fargs[2] == nil then
    opts.fargs[2] = './'
  end

  vim.cmd("cexpr system('%s %s %s', vim.g.ackprg, opts.fargs[1], opts.fargs[2]")
  vim.cmd("copen")

  if vim.o.buftype == "quickfix" then
    vim.cmd("nnoremap gq <CR> execute \"normal! close\"")
  end
end

vim.api.nvim_create_user_command('Ack', Ack, { nargs = '*' })

-- -----------------------------------------------------------------------------
-- Autocommands
-- -----------------------------------------------------------------------------
local augroup = vim.api.nvim_create_augroup('vimrcEx', { clear = true })

-- Jump to last known cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 1 and mark[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = augroup,
  pattern = 'Makefile',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.ledger',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.jbuilder',
  callback = function() vim.bo.filetype = 'ruby' end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'gitcommit',
  callback = function() vim.opt_local.textwidth = 72 end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'gitconfig',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.cmd([[iabbrev <buffer> dc@ <C-R>=strftime('%c')<CR>]])
    vim.cmd([[iabbrev <buffer> dt@ <C-R>=strftime('%F %T')<CR>]])
    vim.cmd([[iabbrev <buffer> dd@ <C-R>=strftime('%A, %B %d, %Y at %H:%M%z')<CR>]])
    vim.cmd([[iabbrev <buffer> dw@ <C-R>=strftime('%Y-W%W-%u')<CR>]])
    vim.cmd([[iabbrev <buffer> dy@ <C-R>=strftime('%Y-%j')<CR>]])

    -- vim.cmd([[iabbrev <buffer> di@ <C-R>=strftime('%s')<CR>]])
    vim.keymap.set('ia', 'di@', function()
      local sec, microsec = vim.uv.gettimeofday()
      return tostring(sec * 1000 + math.floor((microsec / 1000 / 2 + 0.5) * 2))
    end, { buffer = true, expr = true })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { "text", "rst", "org" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'elm',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'lua',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'rust',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})


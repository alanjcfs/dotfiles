-- Load old prelim.vim
vim.cmd [[runtime! prelim.vim]]
require'rg'
require'maps'

--[[
  vim.o is equivalent to :set (:h options.txt)
  vim.g.ctrlp_user_command is equivalent to :let g:ctrlp_user_command
  vim.keymap.set("n", "", "") is equivalent to nnoremap
--]]

-- vim.cmd("unlet g:ack_mappings.q")

vim.o.number = true
vim.o.ignorecase = true
vim.o.clipboard = vim.o.clipboard .. 'unnamed'
vim.g.ctrlp_match_func = { match = 'pymatcher#PyMatch' }

vim.cmd.set('background=dark')

require'coc-setup'

-- Load old prelim.vim
vim.cmd [[runtime! prelim.vim]]



--[[

  vim.o is equivalent to :set (:h options.txt)
  vim.g.ctrlp_user_command is equivalent to :let g:ctrlp_user_command

--]]

-- Begin migration
if vim.fn.executable('rg') then
  vim.o.grepprg='rg --vimgrep'
  vim.g.ctrlp_user_command = 'rg --files -lg "" %s'
  vim.keymap.set("n", "<leader>a", ":Rg<space>")
end

vim.keymap.set("n", "<leader>el", ":split $HOME/.files/vim.d/lua/localmodule.lua<cr>")
vim.keymap.set("n", "<leader>c", ":b#|bd#<cr>")
-- vim.cmd("unlet g:ack_mappings.q")

vim.g.ctrlp_match_func = { match = 'pymatcher#PyMatch' }

require'coc-setup'

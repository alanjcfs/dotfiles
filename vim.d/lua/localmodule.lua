-- Ack/RipGrep
vim.g.ackprg = 'rg --vimgrep --smart-case'
vim.keymap.set("n", "<leader>a", ":Rg<space>")
vim.keymap.set("n", "<leader>el", ":split $HOME/.files/vim.d/lua/localmodule.lua<cr>")
vim.keymap.set("n", "<leader>c", ":b#|bd#<cr>")
-- vim.cmd("unlet g:ack_mappings.q")

if vim.fn.executable('rg') then
	vim.g.ctrlp_user_command = 'rg %s -l --files --color=never --glob ""'
end

vim.g.ctrlp_match_func = { match = 'pymatcher#PyMatch' }

require('coc-config')
require('rg-adapter')

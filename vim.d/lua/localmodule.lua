-- Ack/RipGrep
vim.g.ackprg = 'rg --vimgrep --smart-case'
local ack_mappings = {
	gq = ':cclose<CR>',
	q = nil
}
vim.g.ack_mappings = ack_mappings

if vim.fn.executable('rg') then
	vim.g.ctrlp_user_command = 'rg %s -l --files --color=never --glob ""'
end

-- vim.g.ctrlp_match_func = { 'match': 'matcher#cmatch' }
vim.g.ctrlp_match_func = { match = 'pymatcher#PyMatch' }

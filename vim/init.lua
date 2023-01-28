vim.g.rg_command_name = "Ripgrep"

-- Load old prelim.vim
vim.cmd [[runtime! prelim.vim]]

--[[
  vim.o is equivalent to :set (:h options.txt)
  vim.g.ctrlp_user_command is equivalent to :let g:ctrlp_user_command
  vim.keymap.set("n", "", "") is equivalent to nnoremap
--]]
--

-- -command! -bang -nargs=* Rg
--   \ call fzf#vim#grep(
--   \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
--   \   fzf#vim#with_preview(), <bang>0)-

local keyset = vim.keymap.set

keyset("n", "<leader>d", ":Dispatch<space><up>")

local opts = { silent = true, noremap = true, expr = false }
keyset("i", "jk", "<ESC>", opts)
keyset("n", "<c-p>", ":FZF<CR>", opts)

opts = { silent = false, noremap = true, expr = false, replace_keycodes = false }
keyset("i", "<c-x><c-f>", "fzf#vim#complete#path('rg --files')", opts)
keyset("n", "<leader>a", ":Ripgrep<space>", opts)
keyset("n", "<leader>ev", ":sp $MYVIMRC<CR>", opts)
keyset("n", "<leader>l", ":buffers<CR>:b", opts)

-- vim.cmd("unlet g:ack_mappings.q")
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.confirm = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.undofile = true
-- vim.g.ctrlp_match_func = { match = 'pymatcher#PyMatch' }

vim.cmd.set('background=dark')

require'coc-setup'

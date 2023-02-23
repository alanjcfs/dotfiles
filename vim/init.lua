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

-- Lookup `:h vim.keymap.set()`
-- set({mode}, {lhs}, {rhs}, {opts})
-- See also:
-- * nvim_set_keymap()
-- * nvim_buf_set_keymap()
local keyset = vim.keymap.set
keyset("n", "<leader>d", ":Dispatch<space><up>")
keyset("n", "<leader> ", ":noh<cr>")

local opts = {
  silent = true,
  noremap = true,
  desc = "Avoid echoing when using message"
}
keyset("i", "jk", "<ESC>", opts)
keyset("n", "<c-p>", ":FZF<CR>", opts)

opts = {
  silent = false,
  noremap = true,
}
keyset("i", "<c-x><c-f>", "fzf#vim#complete#path('rg --files')", opts)
keyset("n", "<leader>a", ":Ripgrep<space>", opts)
keyset("n", "<leader>ev", ":sp $MYVIMRC<CR>", opts)
keyset("n", "<leader>l", ":buffers<CR>:b", opts)

-- vim-fugitive
keyset("n", "<leader>g", ":Git ", opts)
keyset("n", "<leader>gb", ":Git blame ", opts)
keyset("n", "<leader>g", ":Gcommit -v ", opts)
keyset("n", "<leader>gd", ":Gdiff ", opts)
keyset("n", "<leader>gw", ":Gwrite<CR>", opts)

-- vim.cmd("unlet g:ack_mappings.q")
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.confirm = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.undofile = true
-- vim.g.ctrlp_match_func = { match = 'pymatcher#PyMatch' }

vim.cmd.set('background=dark')

local bg = "#002b36"
local bgw = "fdf6e3"
vim.cmd.highlight({ args = { "clear SignColumn" } })
vim.cmd.highlight({ args = { "GitGutterAdd guibg=" .. bg } })
vim.cmd.highlight({ args = { "GitGutterChange guibg=" .. bg } })
vim.cmd.highlight({ args = { "GitGutterDelete guibg=" .. bg } })
vim.cmd.highlight({ args = { "GitGutterChangeDelete guibg=" .. bg } })
vim.cmd.highlight({ args = { "CocMenuSel guibg=" .. bg } })
vim.cmd.highlight({ args = { "CocFloatThumb guibg=" .. bg } })
vim.cmd.highlight({ args = { "CocFloating guibg=" .. bg } })
vim.cmd.highlight({ args = { "CocListBgBlue	guibg=" .. bg } })
vim.cmd.highlight({ args = { "CocListBgGrey	guibg=" .. bg } })
vim.cmd.highlight({ args = { "CocListFgBlack	guibg=" .. bg } })
vim.cmd.highlight({ args = { "CocListBgBlue	guibg=" .. bg } })
vim.cmd.highlight({ args = { "CocListFgBlack	guibg=" .. bgw } })
vim.cmd.highlight({ args = { "CocListBgGreen	guibg=" .. bgw } })
vim.cmd.highlight({ args = { "CocListBgCyan	guibg=" .. bgw } })
vim.cmd.highlight({ args = { "CocListBgYellow	guibg=" .. bgw } })
vim.cmd.highlight({ args = { "CocListBgMagenta	guibg=" .. bgw } })


require'coc-setup'

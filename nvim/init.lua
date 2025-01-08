-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local plugin_directory = os.getenv("HOME") .. "/.local/share/nvim/lazy"

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- Load plugins and unmoved vim setup
require("config.lazy")
vim.cmd [[runtime! prelim.vim]]

-- empty setup using defaults
require("nvim-tree").setup()

vim.g.rg_command_name = "Ripgrep"

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
	silent = false,
	noremap = true,
}
keyset("i", "<c-x><c-f>", "fzf#vim#complete#path('rg --files')", opts)
-- keyset("n", "<leader>a", ":Ripgrep<space>", opts)
keyset("n", "<leader>ev", ":sp $MYVIMRC<CR>", opts)
keyset("n", "<leader>sv", ":so $MYVIMRC<CR>", opts)
keyset("n", "<leader>l", ":buffers<CR>:b", opts)

-- NOTE: Disabled because I don't use them
-- keyset("n", "<leader>gb", ":Git blame ", opts)
-- keyset("n", "<leader>g", ":Gcommit -v ", opts)
-- keyset("n", "<leader>gd", ":Gdiff ", opts)
-- keyset("n", "<leader>gw", ":Gwrite<CR>", opts)
-- keyset("n", "<leader>rg", ":Rg<CR>", opts)

-- vim-fugitive
keyset("n", "<leader>g", ":Git ", opts)

opts = {
	silent = true,
	noremap = true,
	desc = "Avoid echoing when using message"
}

keyset("i", "jk", "<ESC>", opts)
keyset("n", "<c-p>", ":Files<CR>", opts)
keyset("n", "<leader>rg", ":Rg<CR>", opts)

-- NOTE: Disabled because vim-sleuth uses same mapping. I also don't know what open_float and seetloclist do
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


--
-- require('lspconfig')['ruby_ls'].setup{ on_attach=on_attach }

-- vim.cmd("unlet g:ack_mappings.q")
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.confirm = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.undofile = true

local status, err = pcall(vim.cmd.colorscheme, "nightfox")
if not status then
	print("Error loading nightfox: " .. err)
end

vim.opt.smartcase = true

vim.opt.list = true -- show whitespace
vim.opt.showmode = false -- show mode, e.g. -- INSERT --, -- VISUAL --, not needed because of lightline

-- coc configuration
vim.g.coc_global_extensions = {
	'coc-json',
	'coc-tsserver',
	'coc-eslint',
	'coc-prettier',
	'coc-css',
	'coc-html',
	'coc-yaml',
	'coc-python',
	'coc-rls',
	'coc-sql',
	'coc-sumneko-lua',
}

local function exists(file)
	local ok, _, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	else
		return false
	end
	return ok
end

local coc = exists(plugin_directory .. "/coc.nvim")
if coc ~= nil then
	require'coc-setup'
else
	print("cannot find coc-setup. not loading")
end

if vim.g.neovide then
	vim.cmd.cd(os.getenv("HOME"))
end

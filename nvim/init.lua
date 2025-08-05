-- disabled for nvimtree netrw at the very start of your init.lua
local plugin_directory = os.getenv("HOME") .. "/.local/share/nvim/lazy"

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- Load plugins and unmoved vim setup
require("config.lazy")
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
	silent = false,
	noremap = true,
}
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

require('nightfox').setup({
	options = {
		transparent = true,
	}
})
local status, err = pcall(vim.cmd.colorscheme, "nightfox")
if not status then
	print("Error loading nightfox: " .. err)
end

vim.opt.smartcase = true

vim.opt.list = true -- show whitespace
vim.opt.showmode = false -- show mode, e.g. -- INSERT --, -- VISUAL --, not needed because of lightline

-- nvim-cmp configuration
-- if utils.exists(plugin_directory .. "/nvim-cmp") then
	require'config.nvim-cmp'
-- end

if vim.g.neovide then
	vim.cmd.cd(os.getenv("HOME"))
end

-- Platform-specific clipboard configuration
if vim.fn.executable('xsel') == 1 then
	-- Linux/Unix clipboard using xsel
	vim.g.clipboard = {
		name = "unnamedplus",
		copy = {
			["+"] = "xsel --clipboard --input",
			["*"] = "xsel --primary --input",
		},
		paste = {
			["+"] = "xsel --clipboard --output",
			["*"] = "xsel --primary --output",
		},
		cache_enabled = 1,
	}
elseif vim.fn.executable('pbcopy') == 1 then
	-- macOS clipboard using pbcopy/pbpaste
	vim.g.clipboard = {
		name = "unnamed",
		copy = {
			["+"] = "pbcopy",
			["*"] = "pbcopy",
		},
		paste = {
			["+"] = "pbpaste",
			["*"] = "pbpaste",
		},
		cache_enabled = 1,
	}
end

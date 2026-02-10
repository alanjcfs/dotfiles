-- =============================================================================
-- NEOVIM CONFIGURATION
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Plugin Management
-- -----------------------------------------------------------------------------
require("config.lazy")
vim.cmd [[runtime! prelim.vim]]

-- -----------------------------------------------------------------------------
-- Core Settings
-- -----------------------------------------------------------------------------
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.confirm = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.undofile = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.showmode = false

-- Disable bracketed paste to prevent control character issues
-- This prevents the terminal from using special escape sequences for paste detection
vim.opt.paste = false
if vim.fn.has('nvim-0.10') == 1 then
  -- For Neovim 0.10+, disable the internal bracketed paste handler
  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      vim.cmd([[set t_BE=]])
    end
  })
end

-- -----------------------------------------------------------------------------
-- Keymappings
-- -----------------------------------------------------------------------------
local keyset = vim.keymap.set

-- General keymaps
local general_opts = { silent = false, noremap = true }
keyset("n", "<leader>d", ":Dispatch<space><up>")
keyset("n", "<leader> ", ":noh<cr>")
keyset("n", "<leader>ev", ":sp $MYVIMRC<CR>", general_opts)
keyset("n", "<leader>sv", ":so $MYVIMRC<CR>", general_opts)
keyset("n", "<leader>l", ":buffers<CR>:b", general_opts)
keyset("n", "<leader>g ", ":Git ", general_opts)
keyset("n", "<leader>gb", ":Git blame", general_opts)

-- Silent keymaps
local silent_opts = { silent = true, noremap = true }
keyset("i", "jk", "<ESC>", silent_opts)
keyset("n", "<c-p>", ":Files<CR>", silent_opts)
keyset("n", "<leader>rg", ":Rg<CR>", silent_opts)

-- -----------------------------------------------------------------------------
-- Color Scheme
-- -----------------------------------------------------------------------------
require('nightfox').setup({
	options = {
		transparent = true,
	}
})

local status, err = pcall(vim.cmd.colorscheme, "nightfox")
if not status then
	print("Error loading nightfox: " .. err)
end

-- -----------------------------------------------------------------------------
-- Plugin Configuration
-- -----------------------------------------------------------------------------
require'config.nvim-cmp'

-- -----------------------------------------------------------------------------
-- Platform-Specific Configuration
-- -----------------------------------------------------------------------------
-- Neovide settings
if vim.g.neovide then
	vim.cmd.cd(os.getenv("HOME"))
end

-- Platform-specific clipboard configuration
if vim.fn.executable('xsel') == 1 then
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

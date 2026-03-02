-- =============================================================================
-- NEOVIM CONFIGURATION
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Plugin Management
-- -----------------------------------------------------------------------------
require("config.lazy")
require("config.autocommands")

-- -----------------------------------------------------------------------------
-- Core Settings
-- -----------------------------------------------------------------------------
-- Indentation defaults (overridden per filetype below)
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.o.clipboard = "unnamed,unnamedplus"
vim.o.confirm = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.textwidth = 120
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
keyset("n", "<leader>a", ":Ripgrep ", general_opts)
keyset("n", "<leader>ev", ":sp $MYVIMRC<CR>", general_opts)
keyset("n", "<leader>sv", ":so $MYVIMRC<CR>", general_opts)
keyset("n", "<leader>l", ":buffers<CR>:b", general_opts)
keyset("n", "<leader>g ", ":Git ", general_opts)
keyset("n", "<leader>gb", ":Git blame", general_opts)
keyset("n", "<leader>gl", ":Gclog -p<space>", general_opts)
keyset("n", "<leader>gw", ":Gwrite<CR>", general_opts)

-- Silent keymaps
local silent_opts = { silent = true, noremap = true }
keyset("i", "jk", "<ESC>", silent_opts)
keyset("n", "<c-p>", ":Files<CR>", silent_opts)
keyset("n", "<leader>r", ":Rg<CR>", silent_opts)
keyset("n", "<leader>e", vim.diagnostic.open_float, silent_opts)
keyset("n", "<leader>t", ":Twrite ", silent_opts)

-- Move lines
keyset("n", "<leader>j", ":m+<cr>==", silent_opts)
keyset("n", "<leader>k", ":m-2<cr>==", silent_opts)
keyset("x", "<leader>j", ":m'>+<cr>gv=gv", silent_opts)
keyset("x", "<leader>k", ":m-2<cr>gv=gv", silent_opts)

-- EasyAlign (remap=true required for <Plug> mappings)
keyset("n", "ga", "<Plug>(EasyAlign)", { silent = true })
keyset("x", "ga", "<Plug>(EasyAlign)", { silent = true })

-- Expand %% to current file's directory in command mode
keyset("c", "%%", function()
  if vim.fn.getcmdtype() == ':' then
    return vim.fn.expand('%:h') .. '/'
  else
    return '%%'
  end
end, { expr = true, noremap = true })

-- -----------------------------------------------------------------------------
-- Color Scheme
-- -----------------------------------------------------------------------------

local status, err = pcall(vim.cmd.colorscheme, "nightfox")

-- -----------------------------------------------------------------------------
-- Platform-Specific Configuration
-- -----------------------------------------------------------------------------
-- Neovide settings
if vim.g.neovide then
  vim.cmd.cd(os.getenv("HOME"))
end

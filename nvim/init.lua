-- =============================================================================
-- NEOVIM CONFIGURATION
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Plugin Management
-- -----------------------------------------------------------------------------
require("config.lazy")

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
-- Autocommands
-- -----------------------------------------------------------------------------
local augroup = vim.api.nvim_create_augroup('vimrcEx', { clear = true })

-- Jump to last known cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 1 and mark[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = augroup,
  pattern = 'Makefile',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = { '*.md', '*.markdown' },
  callback = function() vim.bo.filetype = 'markdown' end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.ledger',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = '*.jbuilder',
  callback = function() vim.bo.filetype = 'ruby' end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'gitcommit',
  callback = function() vim.opt_local.textwidth = 72 end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'gitconfig',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'markdown',
  callback = function() vim.opt_local.textwidth = 80 end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'text',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'elm',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'lua',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'rust',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

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

local status, err = pcall(vim.cmd.colorscheme, "catppuccin-mocha")

-- -----------------------------------------------------------------------------
-- Platform-Specific Configuration
-- -----------------------------------------------------------------------------
-- Neovide settings
if vim.g.neovide then
  vim.cmd.cd(os.getenv("HOME"))
end

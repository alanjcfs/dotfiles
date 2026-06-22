return {
  "neovim/nvim-lspconfig",
  {
    "hrsh7th/cmp-nvim-lsp",

    config = function()
      require'config.nvim-cmp'
    end
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "rafamadriz/friendly-snippets",
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local servers = {
        "ts_ls",
        "elixirls",
        "eslint",
        "lua_ls",
        "rust_analyzer",
        "vuels",
      }
      if vim.fn.executable("gem") == 1 then
        table.insert(servers, "ruby_lsp")
      end
      require("mason-lspconfig").setup({})
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        require("mason-lspconfig").setup({ ensure_installed = servers })
      end, { desc = "Install all configured LSP servers via Mason" })
    end,
  },
}

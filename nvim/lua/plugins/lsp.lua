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
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "elixirls",
          "eslint",
          "lua_ls",
          "ruby_lsp",
          "rust_analyzer",
          "vuels",
        },
      })
    end,
  },
}

return {
  "mbbill/undotree",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-sleuth",
  "tpope/vim-endwise",
  "junegunn/vim-peekaboo",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer local Keymaps (which-key)",
      },
    }
  },
}

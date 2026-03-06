return {
  "tpope/vim-sensible",
  "junegunn/vim-easy-align",
  "mbbill/undotree",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-endwise",
  "tpope/vim-unimpaired",
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
        desc = "Bugfger local Keymaps (which-key)",
      },
    }
  },
}

return {
	"alanjcfs/rg.nvim",
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<c-p>", "<cmd>lua require('fzf-lua').files()<CR>", silent = true },
      { "<leader>r", "<cmd>lua require('fzf-lua').live_grep()<CR>", silent = true },
      { "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", silent = true },
    },
    opts = function()
      local actions = require("fzf-lua.actions")
      return {
        actions = {
          files = {
            true, -- keep fzf-lua's default file actions
            ["ctrl-x"] = actions.file_split,
            -- Send every result to the quickfix list, like :Ripgrep
            ["ctrl-q"] = { fn = actions.file_sel_to_qf, prefix = "select-all" },
          },
        },
      }
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      }
    },
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  }
}

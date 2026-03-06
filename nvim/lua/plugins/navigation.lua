return {
	"alanjcfs/rg.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		keys = {
			{ "<leader>ft", "<cmd>Neotree toggle<CR>", desc = "NeoTree" },
		},
		opts = {},
	},
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<c-p>", "<cmd>lua require('fzf-lua').files()<CR>", silent = true },
      { "<leader>r", "<cmd>lua require('fzf-lua').live_grep()<CR>", silent = true },
      { "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", silent = true },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", silent = true, desc = "Telescope Live Grep" },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
}

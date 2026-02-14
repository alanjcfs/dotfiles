return {
	{
		"junegunn/fzf.vim",
		build = ":call fzf#install()",
		dependencies = {
			"junegunn/fzf",
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>ft", "<cmd>Neotree toggle<CR>", desc = "NeoTree" },
		},
		opts = {},
	},
}

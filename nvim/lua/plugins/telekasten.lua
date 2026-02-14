return {
	{
		"renerocksai/telekasten.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telekasten").setup({
				home = vim.fn.expand("~/Documents/worklog"),
			})
			vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")
		end,
	},
	{ "mattn/calendar-vim" },
}

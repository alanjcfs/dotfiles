return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	cond = function()
		return vim.fn.isdirectory(vim.fn.expand("~/Documents/worklog")) == 1
	end,
	config = function()
		require("telekasten").setup({
			home = vim.fn.expand("~/Documents/worklog"),
		})
		vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")
	end,
}

return {
	{
		"renerocksai/telekasten.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telekasten").setup({
				home = vim.fn.expand("~/Documents/worklog"),
			})

			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			-- Use <leader>wp to discover all commands via the panel
			map("n", "<leader>wp", "<cmd>Telekasten panel<CR>", opts)
			map("n", "<leader>wt", "<cmd>Telekasten goto_today<CR>", opts)
			map("n", "<leader>wn", "<cmd>Telekasten new_note<CR>", opts)
			map("n", "<leader>wf", "<cmd>Telekasten find_notes<CR>", opts)
			map("n", "<leader>wz", "<cmd>Telekasten follow_link<CR>", opts)
		end,
	},
	{ "mattn/calendar-vim" },
}

return {
	{
		"renerocksai/telekasten.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			local home = vim.fn.expand("~/Notes")
			require("telekasten").setup({
				home = home,
				dailies = home .. "/daily",
				notes = home .. "/notes",

				templates = home .. "/templates",
				template_new_daily = home .. "/templates/daily.md",
				template_new_note = home .. "/templates/note.md",

				filename_space_subst = "-",
				filename_small_case = true,
			})

			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("n", "<leader>wp", "<cmd>Telekasten panel<CR>", opts)
			map("n", "<leader>wt", "<cmd>Telekasten goto_today<CR>", opts)
			map("n", "<leader>wn", "<cmd>Telekasten new_note<CR>", opts)
			map("n", "<leader>wf", "<cmd>Telekasten find_notes<CR>", opts)
			map("n", "<leader>wz", "<cmd>Telekasten follow_link<CR>", opts)
		end,
	},
	{ "mattn/calendar-vim" },
}

return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		keys = {
			{ "<leader>zf", "<cmd>ObsidianQuickSwitch<CR>" },
			{ "<leader>zg", "<cmd>ObsidianSearch<CR>" },
			{ "<leader>zd", "<cmd>ObsidianToday<CR>" },
			{ "<leader>zz", "<cmd>ObsidianFollowLink<CR>" },
			{ "<leader>zn", "<cmd>ObsidianNew<CR>" },
			{ "<leader>zb", "<cmd>ObsidianBacklinks<CR>" },
			{ "<leader>zt", "<cmd>ObsidianTags<CR>" },
			{ "<leader>zT", "<cmd>ObsidianToggleCheckbox<CR>" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "notes",
					path = "~/Notes",
				},
			},
			daily_notes = {
				folder = "daily",
				date_format = "%Y-%m-%d",
				template = "daily.md",
			},
			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},
			preferred_link_style = "wiki",
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			mappings = {}, -- disable defaults, define our own below
		},
		config = function(_, opts)
			require("obsidian").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.conceallevel = 1
				end,
			})

			local map = vim.keymap.set
			local o = { noremap = true, silent = true }

			map("n", "<leader>zf", "<cmd>ObsidianQuickSwitch<CR>",    o)
			map("n", "<leader>zg", "<cmd>ObsidianSearch<CR>",         o)
			map("n", "<leader>zd", "<cmd>ObsidianToday<CR>",          o)
			map("n", "<leader>zz", "<cmd>ObsidianFollowLink<CR>",     o)
			map("n", "<leader>zn", "<cmd>ObsidianNew<CR>",            o)
			map("n", "<leader>zb", "<cmd>ObsidianBacklinks<CR>",      o)
			map("n", "<leader>zt", "<cmd>ObsidianTags<CR>",           o)
			map("n", "<leader>zT", "<cmd>ObsidianToggleCheckbox<CR>", o)
		end,
	},
}

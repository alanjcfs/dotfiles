return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		cond = function()
			return vim.fn.isdirectory(vim.fn.expand("~/Notes")) == 1
		end,
		ft = "markdown",
		cmd = {
			"ObsidianOpen",
			"ObsidianQuickSwitch",
			"ObsidianSearch",
			"ObsidianToday",
			"ObsidianFollowLink",
			"ObsidianNew",
			"ObsidianBacklinks",
			"ObsidianTags",
			"ObsidianToggleCheckbox"
		},
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
			"ibhagwan/fzf-lua",
		},
		opts = {
			picker = { name = "fzf-lua" },
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
			disable_frontmatter = function(fname)
			local exclude = { ["CLAUDE.md"] = true }
			return exclude[vim.fs.basename(fname)] or false
		end,
		preferred_link_style = "wiki",
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			mappings = {}, -- disable defaults; ours are in `keys` above
		},
		config = function(_, opts)
			require("obsidian").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.conceallevel = 1
				end,
			})
		end,
	},
}

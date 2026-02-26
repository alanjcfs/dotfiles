return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require('nightfox').setup({
				options = {
					transparent = true,
				}
			})
		end
	},
	{ "ellisonleao/gruvbox.nvim", },
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "sainnhe/gruvbox-material" },
	-- { "altercation/vim-colors-solarized" },
	-- { "sjl/badwolf" },
	-- { "quanganhdo/grb256" },
	-- { "junegunn/seoul256.vim" },
}

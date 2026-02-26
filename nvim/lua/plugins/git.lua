return {
	"airblade/vim-gitgutter",
	"junegunn/gv.vim",
	{
		"petertriho/cmp-git",
		dependencies = { "hrsh7th/nvim-cmp" },
		opts = {},
	},
	{
		"tyru/open-browser.vim",
		dependencies = {
			"tyru/open-browser-github.vim",
		},
	},
}

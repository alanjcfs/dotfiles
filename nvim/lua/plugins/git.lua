return {
	"jreybert/vimagit",
	"airblade/vim-gitgutter",
	"junegunn/gv.vim",
	{
		"petertriho/cmp-git",
		dependencies = { "hrsh7th/nvim-cmp" },
		opts = {},
		init = function()
			table.insert(require("cmp").get_config().sources, { name = "git" })
		end,
	},
	{
		"tyru/open-browser.vim",
		dependencies = {
			"tyru/open-browser-github.vim",
		},
	},
}

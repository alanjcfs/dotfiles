return {
	"airblade/vim-gitgutter",
	{
		"junegunn/gv.vim",
		cmd = "GV",
		dependencies = { "tpope/vim-fugitive" },
	},
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
  {
    "tpope/vim-fugitive", -- Git wrapper :Gwrite, :Gcommit, :Gblame, etc.
    cmd = { "G", "Git", "Gclog", "Gwrite", "Gread", "Gedit", "Gdiffsplit", "Gvdiffsplit", "GBrowse" },
    keys = {
      { "<leader>g ", ":Git ", desc = "Git" },
      { "<leader>gb", ":Git blame", desc = "Git blame" },
      { "<leader>gl", ":Gclog -p ", desc = "Git log" },
      { "<leader>gw", "<cmd>Gwrite<CR>", desc = "Git write (stage)" },
    },
  }
}

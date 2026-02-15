return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
				},
			})
		end,
	},
	"rcarriga/nvim-notify",
	"junegunn/goyo.vim",
	"junegunn/limelight.vim",
}

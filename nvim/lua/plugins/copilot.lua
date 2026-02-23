return {
	"github/copilot.vim",
	init = function()

		vim.g.copilot_filetypes = {
			xml = false,
			markdown = false,
			typst = false,
		}
	end
}

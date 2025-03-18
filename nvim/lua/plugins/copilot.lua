return {
	"github/copilot.vim",
	init = function()

		vim.g.copilot_filetypes = {
			xml = false,
			md = false,
			typst = false,
		}
	end
}

return {
	{
		"christoomey/vim-tmux-navigator",
		config = function()
			-- Prevent vim-tmux-navigator from stealing ctrl-h/j/k/l inside
			-- special float/popup buffers (e.g. Lazy, Mason) where moving focus
			-- away leaves no way to return to the window.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "lazy", "mason" },
				callback = function()
					local keys = { "<c-h>", "<c-j>", "<c-k>", "<c-l>" }
					for _, key in ipairs(keys) do
						vim.keymap.set("n", key, "<nop>", { buffer = true })
					end
				end,
			})
		end,
	},
	"tpope/vim-tbone",
	"tpope/vim-dispatch",
	"skywind3000/asyncrun.vim",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local langs = {
				"bash", "css", "html", "javascript", "json",
				"lua", "markdown", "markdown_inline", "ruby",
				"tsx", "typescript", "vim", "vimdoc", "yaml",
			}

			require("nvim-treesitter").install(langs)

			-- Highlighting delegated to Neovim built-in
			vim.api.nvim_create_autocmd("FileType", {
				callback = function() pcall(vim.treesitter.start) end,
			})

			-- Indentation (experimental)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					if pcall(vim.treesitter.get_parser, 0) then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.foldcolumn = "1"

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
}

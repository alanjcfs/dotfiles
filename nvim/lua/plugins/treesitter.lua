return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local langs = {
        "bash", "css", "elixir", "html", "javascript", "json",
        "lua", "markdown", "markdown_inline", "ruby",
				"tsx", "typescript", "vim", "vimdoc", "yaml",
			}

			local missing = vim.tbl_filter(function(lang)
			return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".so", false) == 0
		end, langs)
		if #missing > 0 then
			require("nvim-treesitter").install(missing)
		end

			-- Highlighting delegated to Neovim built-in
			vim.api.nvim_create_autocmd("FileType", {
				callback = function() pcall(vim.treesitter.start) end,
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

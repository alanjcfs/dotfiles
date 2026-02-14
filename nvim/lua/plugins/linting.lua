return {
	{
		"dense-analysis/ale",
		init = function()
			vim.g.ale_fix_on_save = 1

			vim.g.ale_fixers = {
				javascript = {
				'remove_trailing_lines',
				'trim_whitespace',
				},
				vue = {
				'remove_trailing_lines',
				'trim_whitespace',
				},
			}

			vim.g.ale_disable_lsp = 1

			vim.g.ale_exclude_highlights = { 'indentation detected' }
		end
	},
	{
		"Chiel92/vim-autoformat",
		init = function()
			vim.g.formatters_javascriptreact = { 'eslint_local' }
		end
	},
}

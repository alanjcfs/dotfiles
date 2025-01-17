return {
	"tpope/vim-sensible",

	-- Code Editing
	-- "honza/vim-snippets",
	"junegunn/vim-easy-align",
	"mbbill/undotree",
	"tpope/vim-commentary",

	'rcarriga/nvim-notify',
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',

	'nvimtools/none-ls.nvim', -- linting and formatting
	{
		'williamboman/mason.nvim', -- maintain lsp packages
		opts = {},
	},
	'williamboman/mason-lspconfig.nvim', -- integration with lspconfig

	--  completion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
	'rafamadriz/friendly-snippets', -- collection of pre-made snippets
	{
		'petertriho/cmp-git',
		dependencies = { 'hrsh7th/nvim-cmp' },
		opts = {},
		init = function()
			table.insert(require('cmp').get_config().sources, { name = "git" })
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>ft", "<cmd>Neotree toggle<CR>", desc = "NeoTree" },
		},
		opts = {},
	},
	-- {
	-- 	'neoclide/coc.nvim',
	-- 	build = 'npm ci'
	-- 	init = function()
	-- 		vim.g.coc_global_extensions = {
	-- 			'coc-json',
	-- 			'coc-tsserver',
	-- 			'coc-eslint',
	-- 			'coc-prettier',
	-- 			'coc-css',
	-- 			'coc-html',
	-- 			'coc-yaml',
	-- 			'coc-python',
	-- 			'coc-rls',
	-- 			'coc-sql',
	-- 			'coc-sumneko-lua',
	-- 		}
	--
	-- 		require'coc-setup'
	-- 	end
	-- },
	-- {
		-- 'alanjcfs/rg.nvim',
		-- init = function()
		--		vim.g.rg_command_name = "Ripgrep"
		--	end

	 -- {
			-- 'nvim-tree/nvim-tree.lua',
			-- dependencies = {
				-- 'nvim-tree/nvim-web-devicons',
			-- },
			-- init = function()
				-- vim.g.loaded_netrw = 1
				-- vim.g.loaded_netrwPlugin = 1

				-- require'nvim-tree'.setup()
			-- end
	 -- },

	{
		"junegunn/fzf.vim",
		build = function()
			vim.cmd("call fzf#install()")
		end,
		dependencies = {
			"junegunn/fzf",
		}
	},
	{
		"dense-analysis/ale",
		init = function()
			-- NOTE: ALE recommends using ftplugin file instead of setting globally. Look
			-- into using ~/.vim/ftplugin/javascript.vim and add b:ale_fixers
			-- set ofu=ale#completion#OmniFunc
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

			-- Disable Language Server Protocol to avoid conflict with CoC
			vim.g.ale_disable_lsp = 1
			-- let g:ale_sign_column_always = 1

			vim.g.ale_exclude_highlights = { 'indentation detected' }
		end
	},
	{
		"Chiel92/vim-autoformat",
		init = function()
			vim.g.formatters_javascriptreact = { 'eslint_local' }
			-- let g:formatters_javascript = ['eslint_local']
		end
	},

	"fatih/vim-go",
	"elixir-editors/vim-elixir",
	"mattn/emmet-vim",
	"racer-rust/vim-racer",
	"rust-lang/rust.vim",
	"chrisbra/csv.vim",

	"skywind3000/asyncrun.vim",

	-- JS Syntax
	"posva/vim-vue",
	"leafgarland/typescript-vim",
	"HerringtonDarkholme/yats.vim",

	-- Statusline
	"itchyny/lightline.vim",

	-- Git
	"jreybert/vimagit",

	-- Ruby
	"sunaku/vim-ruby-minitest",

	-- Miscellaneous
	"airblade/vim-gitgutter",
	"christoomey/vim-tmux-navigator",


	-- GitHub
	{
		"tyru/open-browser.vim",
		dependencies = {
			"tyru/open-browser-github.vim",
		},
	},



	-- The prolific Mr. T. Pope
	"tpope/vim-dispatch", -- :Dispatch to run commands asynchronously
	-- "tpope/vim-endwise" -- end structures automatically
	-- "rstacruz/vim-closer",
	"tpope/vim-markdown", -- Markdown support
	"vim-ruby/vim-ruby", -- Ruby support
	"tpope/vim-rails", -- Rails support
	"tpope/vim-rake", -- rake tasks using :Rake
	"tpope/vim-repeat", -- repeat plugin maps
	"tpope/vim-sleuth", -- adjust shiftwidth/expandtab heuristically,
	"tpope/vim-surround", -- surround text objects with brackets, quotes, etc.
	"tpope/vim-tbone", -- tmux, vim, and system clipboard integration
	"tpope/vim-unimpaired", -- brackets navigation
	"junegunn/gv.vim", -- git commit browser by using :GV
	"junegunn/vim-peekaboo", -- show registers by pressing "
	"junegunn/goyo.vim", -- distraction-free writing
	"junegunn/limelight.vim" -- focus on current paragraph
}

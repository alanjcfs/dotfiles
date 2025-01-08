return {
	"tpope/vim-sensible",
	"github/copilot.vim",

	-- Code Editing
	"honza/vim-snippets",
	"junegunn/vim-easy-align",
	"mbbill/undotree",
	"tpope/vim-commentary",

	'rcarriga/nvim-notify',
	'neovim/nvim-lspconfig',
	{
		'neoclide/coc.nvim',
		build = 'npm ci'
	},
	'alanjcfs/rg.nvim',
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		}
	},

{
	"junegunn/fzf.vim",
		build = function()
			vim.cmd("call fzf#install()")
		end,
		dependencies = {
			"junegunn/fzf",
		}
	},
	"dense-analysis/ale",
	"Chiel92/vim-autoformat",

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

return require('packer').startup(function()
	use 'lewis6991/impatient.nvim'

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'p00f/nvim-ts-rainbow'
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'windwp/nvim-ts-autotag'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'tpope/vim-commentary'

	-- Better detection of arguments of functions using treesitter.
	use {
		'm-demare/hlargs.nvim',
		requires = { 'nvim-treesitter/nvim-treesitter' }
	}

	-- Uses treesitter to not check spelling in code.
	-- highlight should not be set in treesitter. But this option is
	-- required by Neog, breaking this plugin.
	-- use {
	-- 	'lewis6991/spellsitter.nvim',
	-- 	config = function()
	-- 	require('spellsitter').setup()
	-- 	end
	-- }

	use {"neovim/nvim-lspconfig",}
	use 'dense-analysis/ale'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- Prose
	use "Pocco81/TrueZen.nvim"
	use "junegunn/limelight.vim"

	use 'simrat39/symbols-outline.nvim'
	use 'ludovicchabant/vim-gutentags'
	-- use 'szw/vim-tags'
	use 'preservim/tagbar'

	use {
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup {
				log_level = 'info',
				auto_session_suppress_dirs = {'~/Projects'}
			}
		end
	}

	-- Enable readline shortcuts in insert/command mode.
	use 'tpope/vim-rsi'
	-- use 'linty-org/readline.nvim'

	-- Illuminate occurrences of the current workd.
	use 'RRethy/vim-illuminate'

	-- Shows indentation.
	use "lukas-reineke/indent-blankline.nvim"
	-- use "glepnir/indent-guides.nvim"

	use 'kazhala/close-buffers.nvim'
	use 'ThePrimeagen/harpoon'

	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
	}

	use {
		"NTBBloodbath/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					show_http_info = true,
					show_headers = true,
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = '.env',
			custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end
	}

	-- Shows a floating window with the context of the error shown in the
	-- quickfix list.
	-- Integrates with FZF.
	use {'kevinhwang91/nvim-bqf'}

	-- Prettier.
	use 'https://gitlab.com/yorickpeterse/nvim-pqf'

	use({
		'crispgm/nvim-tabline',
		config = function()
			require('tabline').setup({})
		end,
	})

	-- Useful to choose colours in CSS.
	use 'norcalli/nvim-colorizer.lua'
	use ({"ziontee113/color-picker.nvim",
		config = function()
			require("color-picker")
		end,
	})

	use {
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers",
		config = function()
			require('neorg').setup {
			}
		end,
		requires = "nvim-lua/plenary.nvim"
	}

	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'tpope/vim-abolish'
	use 'tpope/vim-eunuch'

	-- Not good with symbols in Lisp.
	-- use 'jiangmiao/auto-pairs'
	-- use 'Raimondi/delimitMate'
	-- use {
	-- "windwp/nvim-autopairs",
	-- config = function() require("nvim-autopairs").setup {} end
	-- }

	-- Better handling of symbols in Lisp.
	-- But <C-h> in insert mode is not treated as <BS>, thus, does not
	-- remove the pair.
	-- use '/cohama/lexima.vim'
	use 'kana/vim-smartinput'

	use 'godlygeek/tabular'
	-- use 'dhruvasagar/vim-table-mode'

	use 'mbbill/undotree'
	use 'ntpeters/vim-better-whitespace'
	-- use 'bronson/vim-trailing-whitespace'
	use 'mhinz/vim-grepper'
	use 'tmhedberg/SimpylFold'
	use 'andymass/vim-matchup'
	use 'wellle/targets.vim'

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'mhinz/vim-signify'
	use 'junegunn/gv.vim'
	use {
		'ruifm/gitlinker.nvim',
		requires = 'nvim-lua/plenary.nvim',
	}

	use 'wellle/tmux-complete.vim'
	use 'tpope/vim-tbone'

	-- use 'euclio/vim-markdown-composer'
	use {"ellisonleao/glow.nvim"}

	use {"jez/vim-superman"}

	-- Colorscheme
	-- use 'vim-scripts/CycleColor'
	use 'vimoxide/vim-cinnabar'
	use 'vigoux/oak'

	-- Use Ranger.
	use 'kevinhwang91/rnvimr'

	-- Might be useful if need to avoid multiple instances of nvim embedded
	-- in each other.
	-- use 'mhinz/neovim-remote'

	-- Clojure
	-- use 'tpope/vim-fireplace'

	-- Code actions
	-- use {
	-- 	'kosayoda/nvim-lightbulb',
	-- 	requires = 'antoinemadec/FixCursorHold.nvim',
	-- }

	-- Generate some errors randomly.
	-- use 'gennaro-tedesco/nvim-jqx'
end)

return require('packer').startup(function()
	use 'lewis6991/impatient.nvim'

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'RRethy/nvim-treesitter-textsubjects'
	use 'p00f/nvim-ts-rainbow'
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'tpope/vim-commentary'

	-- Better detection of arguments of functions using treesitter.
	use {
		'm-demare/hlargs.nvim',
		requires = { 'nvim-treesitter/nvim-treesitter' }
	}

	use {"neovim/nvim-lspconfig",}

	-- Shows symbols.
	use 'simrat39/symbols-outline.nvim'

	-- Restore sessions.
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
	use 'linty-org/readline.nvim'

	-- Creates missing directories when writting a file.
	use {'jghauser/mkdir.nvim'}

	-- Uses treesitter to not check spelling in code.
	use {
		'lewis6991/spellsitter.nvim',
		config = function()
			require('spellsitter').setup()
		end
	}

	-- Illuminate occurrences of the current workd.
	use 'RRethy/vim-illuminate'

	-- Shows indentation.
	use "lukas-reineke/indent-blankline.nvim"
	-- use "glepnir/indent-guides.nvim"

	-- Use Ranger.
	use 'kevinhwang91/rnvimr'

	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
	}

	-- Runs code.
	use { 'michaelb/sniprun', run = 'bash ./install.sh'}

	-- Shows a floating window with the context of the error shown in the
	-- quickfix list.
	use {'kevinhwang91/nvim-bqf'}
	-- Prettier.
	use 'https://gitlab.com/yorickpeterse/nvim-pqf'

	use {
		"nvim-neorg/neorg",
		config = function()
			require('neorg').setup {
			}
		end,
		requires = "nvim-lua/plenary.nvim"
	}
	use "max397574/neorg-kanban"

	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'tpope/vim-abolish'

	-- Not good with symbols in Lisp.
	-- use 'jiangmiao/auto-pairs'
	-- use 'Raimondi/delimitMate'
	-- use {
	-- "windwp/nvim-autopairs",
	-- config = function() require("nvim-autopairs").setup {} end
	-- }

	-- Better handling of symbols in Lisp.
	-- But <C-h> in insert mode is not treated as <BS>, thus, removes not the
	-- pair.
	-- use '/cohama/lexima.vim'

	use 'kana/vim-smartinput'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	use 'godlygeek/tabular'
	use 'mbbill/undotree'
	use 'dense-analysis/ale'
	use 'tpope/vim-eunuch'
	use 'ntpeters/vim-better-whitespace'
	use 'pechorin/any-jump.vim'
	use 'tmhedberg/simpylfold'

	-- Generate some errors randomly.
	-- use 'gennaro-tedesco/nvim-jqx'

	use 'tpope/vim-unimpaired'
	use 'wellle/targets.vim'
	use 'andymass/vim-matchup'
	use 'dhruvasagar/vim-table-mode'

	use 'ludovicchabant/vim-gutentags'
	-- use 'szw/vim-tags'
	use 'preservim/tagbar'

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

	use({
		'crispgm/nvim-tabline',
		config = function()
			require('tabline').setup({})
		end,
	})

	-- Prose
	use "Pocco81/TrueZen.nvim"
	use "junegunn/limelight.vim"
	use "rhysd/vim-grammarous"

	use 'MarcWeber/vim-addon-mw-utils'
	use 'tomtom/tlib_vim'
	use 'garbas/vim-snipmate'
	use 'honza/vim-snippets'

	use 'mhinz/vim-grepper'

	-- use 'tpope/vim-fireplace'

	-- use {
	-- 	'kosayoda/nvim-lightbulb',
	-- 	requires = 'antoinemadec/FixCursorHold.nvim',
	-- }

	-- Colorscheme
	-- use 'vim-scripts/CycleColor'
	use 'vimoxide/vim-cinnabar'
	use 'vigoux/oak'
end)

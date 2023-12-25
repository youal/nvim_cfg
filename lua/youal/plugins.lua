vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	{
		'nvim-neorg/neorg',
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		version = 'v6.2.0',
		ft = "norg",
		config = function()
			vim.keymap.set('n', '<Leader>toc', ':Neorg toc<CR>', {})
			vim.keymap.set('n', '<Leader>cm', ':Neorg keybind all core.looking-glass.magnify-code-block<CR>', {})

			require('neorg').setup {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},}}
		end,
	},
	{
		'jubnzv/mdeval.nvim',
		ft = "norg",
		config = function()
			require 'mdeval'.setup({
				require_confirmation=false,
				eval_options = {
					sh = {
						command = {"sh"},
						language_code = "sh",
						exec_type = "interpreted",
						extension = "sh",
					},
				},
			})

			vim.api.nvim_set_keymap('n', '<leader>cr',
				"<cmd>lua require 'mdeval'.eval_code_block()<CR>",
				{silent = true, noremap = true})
		end
	},
	{
		'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {}
		end
	},
	-- {
	-- 	'backdround/tabscope.nvim',
	-- 	config = function()
	-- 		require("tabscope").setup({})
	-- 	end,
	-- },
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require("youal.treesitter")
			vim.cmd([[
			set foldmethod=expr
			set foldexpr=nvim_treesitter#foldexpr()
			set nofoldenable
			]])
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		lazy = false,
		opts = { useDefaultKeymaps = true },
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{
		"ellisonleao/glow.nvim",
		config = function()
			require('glow').setup({
				width_ratio = 1.0,
				height_ratio = 1.0,
			})
		end,
		cmd = "Glow"
	},
	{
		'sysedwinistrator/readline.nvim',
		config = function()
			local readline = require('readline')
			vim.keymap.set('!', '<M-f>', readline.forward_word)
			vim.keymap.set('!', '<M-b>', readline.backward_word)
			vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
			vim.keymap.set('!', '<C-e>', readline.end_of_line)
			vim.keymap.set('!', '<M-d>', readline.kill_word)
			vim.keymap.set('!', '<M-BS>', readline.backward_kill_word)
			vim.keymap.set('!', '<C-w>', readline.unix_word_rubout)
			vim.keymap.set('!', '<C-k>', readline.kill_line)
			vim.keymap.set('!', '<C-u>', readline.backward_kill_line)
			vim.keymap.set('!', '<C-b>', '<Left>')
		end,
	},
	{
		'mfussenegger/nvim-lint',
		config = function()
			vim.api.nvim_create_autocmd(
				{ "BufEnter", "InsertLeave", "TextChanged" },
				{
					pattern = { "*.lua", "*.py", "*.sh" },
					callback = function()
						require("lint").try_lint()
					end,
				})

			require('lint').linters_by_ft = {
				lua = {'luacheck',},
				python = {'ruff',},
				sh = {'shellcheck',},
			}
		end
	},
	{
		'jiangmiao/auto-pairs',
		config = function()
			vim.cmd([[
				au BufRead,BufNewFile *.scm let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
				au FILETYPE lisp let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
			]])
		end,
	},
	{
		'rlane/pounce.nvim',
		config = function()
			vim.keymap.set(
				'n',
				'<leader>jp',
				function() vim.cmd("Pounce") end, {})
		end
	},
	{
		'kien/rainbow_parentheses.vim',
		config = function()
			vim.cmd([[
			au VimEnter * RainbowParenthesesToggle
			au Syntax * RainbowParenthesesLoadRound
			au Syntax * RainbowParenthesesLoadSquare
			au Syntax * RainbowParenthesesLoadBraces
			]])
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		keys = {
			{ "<leader>lF", "<cmd>Lazy load telescope.nvim<cr>", },
		},
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup {}
			require('telescope').load_extension('fzf')

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

			vim.keymap.set('n',
				'<leader>fj',
				function() vim.cmd('Telescope jumplist') end, {})

			vim.keymap.set(
				'n',
				'<leader>fw',
				function() vim.cmd("Telescope workspaces") end, {})

			vim.keymap.set(
				'n',
				'<leader>fd',
				function() vim.cmd("Telescope docker") end, {})

			vim.keymap.set(
				'n',
				'<leader>ft',
				function() vim.cmd("Telescope telescope-tabs list_tabs") end, {})

			vim.keymap.set(
				'n',
				'<leader>fe',
				function() vim.cmd("Telescope file_browser") end, {})

			vim.keymap.set(
				'n',
				'<leader>fF',
				function() vim.cmd("Telescope frecency") end, {})

		end
	},
	{
		"LukasPietzschmann/telescope-tabs",
		cmd = "Telescope telescope-tabs",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		cmd = "Telescope file_browser",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		'is0n/fm-nvim',
		cmd = "Lf",
		config = function()
			require('fm-nvim').setup{
				-- (Vim) Command used to open files
				edit_cmd = "edit",

				-- See `Q&A` for more info
				on_close = {},
				on_open = {},

				-- UI Options
				ui = {
					-- Default UI (can be "split" or "float")
					default = "float",

					float = {
						-- Floating window border (see ':h nvim_open_win')
						border    = "none",

						-- Highlight group for floating window/border (see ':h winhl')
						float_hl  = "Normal",
						border_hl = "FloatBorder",

						-- Floating Window Transparency (see ':h winblend')
						blend     = 0,

						-- Num from 0 - 1 for measurements
						height    = 1.0,
						width     = 1.0,

						-- X and Y Axis of Window
						x         = 0.5,
						y         = 0.5
					},

					split = {
						-- Direction of split
						direction = "topleft",

						-- Size of split
						size      = 24
					}
				},

				-- Terminal commands used w/ file manager (have to be in your $PATH)
				cmds = {
					lf_cmd      = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
					fm_cmd      = "fm",
					nnn_cmd     = "nnn",
					fff_cmd     = "fff",
					twf_cmd     = "twf",
					fzf_cmd     = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
					fzy_cmd     = "find . | fzy",
					xplr_cmd    = "xplr",
					vifm_cmd    = "vifm",
					skim_cmd    = "sk",
					broot_cmd   = "broot",
					gitui_cmd   = "gitui",
					ranger_cmd  = "ranger",
					joshuto_cmd = "joshuto",
					lazygit_cmd = "lazygit",
					neomutt_cmd = "neomutt",
					taskwarrior_cmd = "taskwarrior-tui"
				},

				-- Mappings used with the plugin
				mappings = {
					vert_split = "<C-v>",
					horz_split = "<C-h>",
					tabedit    = "<C-t>",
					edit       = "<C-e>",
					ESC        = "<ESC>"
				},

				-- Path to broot config
				broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson"
			}
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		cmd = "Telescope frecency",
	},
	-- {
	-- 	"nvim-telescope/telescope-project.nvim",
	-- 	config = function()
	-- 		require'telescope'.load_extension('project')
	-- 	end,
	-- },
	{
		"natecraddock/workspaces.nvim",
		cmd = "Telescope workspaces",
		dependencies = {
			{'nvim-telescope/telescope.nvim'},
		},
		config = function()
			require("workspaces").setup({ cd_type = "tab", })
		end,
	},
	{
		"lpoto/telescope-docker.nvim",
		cmd = "Telescope docker",
		dependencies = {
			{'nvim-telescope/telescope.nvim'},
		},
		config = function()
			require("telescope").setup {
				-- extensions = {
				-- 	docker = {
				-- 		theme = "ivy",
				-- 		binary = "podman",
				-- 		compose_binary = "docker compose",
				-- 		buildx_binary = "docker buildx",
				-- 		machine_binary = "docker-machine",
				-- 		log_level = vim.log.levels.INFO,
				-- 		"vsplit new", "split new", ...
				-- 		init_term = "tabnew",
				-- 	},
				-- },
			}

			require("telescope").load_extension "docker"
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{'kkharji/sqlite.lua', module = 'sqlite'},
			{'nvim-telescope/telescope.nvim'},
		},
		config = function()
			require('telescope').load_extension('neoclip')
			require('neoclip').setup()
		end,
	},

	-- Colorscheme
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	"olimorris/onedarkpro.nvim",
	-- 	"rebelot/kanagawa.nvim",
	-- 	"savq/melange-nvim",
	-- 	"tiagovla/tokyodark.nvim",
	-- 	'AlexvZyl/nordic.nvim',
	-- 	'Mofiqul/dracula.nvim',
	-- 	'Mofiqul/vscode.nvim',
	-- 	'RRethy/nvim-base16',
	-- 	'bluz71/vim-moonfly-colors',
	-- 	'bluz71/vim-nightfly-colors',
	-- 	'catppuccin/nvim',
	-- 	'christianchiarulli/nvcode-color-schemes.vim',
	-- 	'embark-theme/vim',
	-- 	'fenetikm/falcon',
	-- 	'folke/tokyonight.nvim',
	-- 	'frenzyexists/aquarium-vim',
	-- 	'glepnir/zephyr-nvim',
	-- 	'luisiacc/gruvbox-baby',
	-- 	'marko-cerovac/material.nvim',
	-- 	'mhartington/oceanic-next',
	-- 	'navarasu/onedark.nvim',
	-- 	'nyoom-engineering/oxocarbon.nvim',
	-- 	'olivercederborg/poimandres.nvim',
	-- 	'projekt0n/github-nvim-theme',
	-- 	'ray-x/aurora',
	-- 	'rmehri01/onenord.nvim',
	-- 	'rose-pine/neovim',
	-- 	'sainnhe/edge',
	-- 	'sainnhe/everforest',
	-- 	'sainnhe/gruvbox-material',
	-- 	'sainnhe/sonokai',
	-- 	'shaunsingh/nord.nvim',
	-- 	'tanvirtin/monokai.nvim',
	-- 	'tomasiser/vim-code-dark',
	-- },
	-- {
	-- 	'folke/tokyonight.nvim',
	-- 	lazy = false,    -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		vim.cmd([[colorscheme tokyonight-night]])
	-- 	end,
	-- },

	-- LSP
	-- {
	-- 	'simrat39/symbols-outline.nvim',
	-- 	config = function()
	-- 		require("youal.symbols")
	-- 	end,
	-- },
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		vim.diagnostic.config({virtual_text = false,})
	-- 		require("lsp_lines").setup()
	-- 	end,
	-- },
	-- {
	-- 	"folke/trouble.nvim",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		require("trouble").setup {
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			-- refer to the configuration section below
	-- 		}
	-- 	end
	-- },

	-- Completion
	-- {
	-- 	'hrsh7th/nvim-cmp',
	-- 	dependencies = {
	-- 		'hrsh7th/cmp-nvim-lsp',
	-- 		'hrsh7th/cmp-buffer',
	-- 		'saadparwaiz1/cmp_luasnip',
	-- 	},
	-- 	config = function()
	-- 		local cmp = require'cmp'
	--
	-- 		cmp.setup({
	-- 			snippet = {
	-- 				-- REQUIRED - you must specify a snippet engine
	-- 				expand = function(args)
	-- 					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	-- 					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	-- 					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	-- 					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	-- 				end,
	-- 			},
	-- 			-- window = {
	-- 				-- 	-- completion = cmp.config.window.bordered(),
	-- 				-- 	-- documentation = cmp.config.window.bordered(),
	-- 				-- },
	-- 				mapping = cmp.mapping.preset.insert({
	-- 					['<C-b>'] = cmp.mapping.scroll_docs(-4),
	-- 					['<C-f>'] = cmp.mapping.scroll_docs(4),
	-- 					['<C-Space>'] = cmp.mapping.complete(),
	-- 					['<C-e>'] = cmp.mapping.abort(),
	-- 					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 				}),
	-- 				sources = cmp.config.sources({
	-- 					{ name = 'nvim_lsp' },
	-- 					-- { name = 'vsnip' }, -- For vsnip users.
	-- 					{ name = 'luasnip' }, -- For luasnip users.
	-- 					-- { name = 'ultisnips' }, -- For ultisnips users.
	-- 					-- { name = 'snippy' }, -- For snippy users.
	-- 				}, {
	-- 					{ name = 'buffer' },
	-- 				})
	-- 			})
	--
	-- 		end,
	-- 	},

	-- Snipets
	{
		'L3MON4D3/LuaSnip',
		lazy = true,
		config = function()
			-- Use Tab (or some other key if you prefer) to trigger visual selection
			require('neoclip').setup({
				store_selection_keys = "y",
			})
			require("luasnip").config.set_config({
				store_selection_keys = "<Tab>",
			})
		end,
	},

	{
		'preservim/tagbar',
		config = function()
			vim.g.tagbar_show_linenumbers = 2
		end
	},
	'ludovicchabant/vim-gutentags',
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup{
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map('n', ']c', function()
						if vim.wo.diff then return ']c' end
						vim.schedule(function() gs.next_hunk() end)
						return '<Ignore>'
					end, {expr=true})

					map('n', '[c', function()
						if vim.wo.diff then return '[c' end
						vim.schedule(function() gs.prev_hunk() end)
						return '<Ignore>'
					end, {expr=true})

					-- Actions
					map('n', '<leader>hs', gs.stage_hunk)
					map('n', '<leader>hr', gs.reset_hunk)
					map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
					map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
					map('n', '<leader>hS', gs.stage_buffer)
					map('n', '<leader>hu', gs.undo_stage_hunk)
					map('n', '<leader>hR', gs.reset_buffer)
					map('n', '<leader>hp', gs.preview_hunk)
					map('n', '<leader>hb', function() gs.blame_line{full=true} end)
					map('n', '<leader>tb', gs.toggle_current_line_blame)
					map('n', '<leader>hd', gs.diffthis)
					map('n', '<leader>hD', function() gs.diffthis('~') end)
					map('n', '<leader>td', gs.toggle_deleted)

					-- Text object
					map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
				end
			}
		end,
	},
	'tpope/vim-fugitive',
	{
		'sindrets/diffview.nvim',
		cmd = "DiffviewOpen",
	},
	{
		'mizlan/iswap.nvim',
		cmd = "ISwap",
		keys = {
			{ "<leader>sp", "<cmd>ISwap<cr>" },
		},
		config = function()
			vim.keymap.set('n', '<Leader>sp', ':ISwap<CR>', {})
		end
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<M-h>", "<cmd>TmuxNavigateLeft<cr>" },
			{ "<M-j>", "<cmd>TmuxNavigateDown<cr>" },
			{ "<M-k>", "<cmd>TmuxNavigateUp<cr>" },
			{ "<M-l>", "<cmd>TmuxNavigateRight<cr>" },
			{ "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
		},
	},
	'wellle/tmux-complete.vim',

	{ "nvim-tree/nvim-web-devicons", lazy = true },

	'glts/vim-radical',
	'glts/vim-magnum',

	'bronson/vim-trailing-whitespace',
	'junegunn/vim-easy-align',
	'mbbill/undotree',
	'wellle/context.vim',
	'famiu/bufdelete.nvim',
	'tmux-plugins/vim-tmux',
	'wellle/targets.vim',
	'metakirby5/codi.vim',
	'tpope/vim-eunuch',
	'tpope/vim-abolish',
	'tpope/vim-endwise',
	'tpope/vim-repeat',
	'tpope/vim-tbone',
	'tpope/vim-surround',
	'tpope/vim-dispatch',

	-- DB
	-- 'tpope/vim-dadbod',

	-- 'JoosepAlviste/nvim-ts-context-commentstring',
	-- 'lukas-reineke/indent-blankline.nvim',
	-- 'junegunn/goyo.vim',
	-- 'andymass/vim-matchup',
	-- 'mhinz/vim-grepper',
	-- kevinhwang91/nvim-bqf
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	{
		'nvim-neorg/neorg',
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		version = 'v6.0.0',
		config = function()
			require('neorg').setup {
				load = {
					["core.defaults"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
								work = "~/notes/work",
								home = "~/notes/home",
							},
							default_workspace = "notes",
						}
					},
					["core.concealer"] = {},
					["core.export"] = {},
					["core.export.markdown"] = {},
				}
			}
		end,
	},
	{
		"kylechui/nvim-surround",
		lazy = false,
		-- tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {}
		end
	},
	{
		'backdround/tabscope.nvim',
		config = function()
			require("tabscope").setup({})
		end,
	},
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
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{
		'windwp/nvim-autopairs',
		config = function()
			require("nvim-autopairs").setup {}
		end
	},

--	{
--		'folke/tokyonight.nvim',
--		lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--		priority = 1000, -- make sure to load this before all the other start plugins
--		config = function()
--			vim.cmd([[colorscheme tokyonight-night]])
--		end,
--	},
--	{
--		'nvim-treesitter/nvim-treesitter-textobjects',
--		dependencies = 'nvim-treesitter/nvim-treesitter',
--	},
	-- {
	-- 	-- https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md
	-- 	-- https://github.com/williamboman/mason.nvim/wiki/Extensions
	-- 	'williamboman/mason.nvim',
	-- 	config = function()
	-- 		require("mason").setup {}
	-- 	end
	-- },
	{
		-- Available servers:
		-- https://github.com/williamboman/mason-lspconfig.nvim
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig',
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = {
					'ruff_lsp',
					'lua_ls',
				},
				automatic_installation = true,
			}
			require("youal.lspconfig")
		end
	},
	{
		'mfussenegger/nvim-lint',
		config = function()
			require('lint').linters_by_ft = {
				sh = {'shellcheck',}
			}
		end
	},
	{
		'HiPhish/nvim-ts-rainbow2',
		config = function()
			require("nvim-treesitter.configs").setup {
				rainbow = {
					enable = true,
					-- list of languages you want to disable the plugin for
					disable = {},
					-- Which query to use for finding delimiters
					query = 'rainbow-parens',
					-- Highlight the entire buffer all at once
					strategy = require 'ts-rainbow.strategy.global',
				}
			}
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup {}
			require('telescope').load_extension('fzf')
			-- require("telescope").load_extension "file_browser"
			-- require('telescope').load_extension('neoclip')

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
--	{
--		'WhoIsSethDaniel/mason-tool-installer.nvim',
--		config = function()
--			require('mason-tool-installer').setup {
--				ensure_installed = {
--					'gopls',
--					'shellcheck',
--					'lua-language-server',
--					-- 'luacheck',
--					'clangd',
--					'jsonnet-language-server',
--					'hadolint',
--					'yamllint',
--					'ansible-lint',
--				}}
--		end,
--	},
--	{
--		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--		-- https://github.com/neovim/nvim-lspconfig/wiki/Language-specific-plugins
--		-- https://github.com/neovim/nvim-lspconfig/wiki/Snippets
--		"neovim/nvim-lspconfig",
--		config = function()
--			require("youal.lspconfig")
--		end,
--	},
--	-- What is the difference with mason-tool-installer ?
--	-- {
--	-- 	'jay-babu/mason-null-ls.nvim',
--	-- 	config = function()
--	-- 		require("mason-null-ls").setup({
--	-- 			ensure_installed = {"shellcheck"}
--	-- 		})
--	-- 	end
--	-- },
--	{
--		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
--		"jose-elias-alvarez/null-ls.nvim",
--		dependencies = 'nvim-lua/plenary.nvim',
--		config = function()
--			local null_ls = require("null-ls")
--			null_ls.setup {
--				sources = {
--					-- Extremely heavy. Makes my laptop crash when reading
--					-- the code of Kubernetes.
--					-- null_ls.builtins.diagnostics.staticcheck,
--					-- null_ls.builtins.diagnostics.revive,
--					-- null_ls.builtins.diagnostics.luacheck,
--					null_ls.builtins.diagnostics.shellcheck,
--					null_ls.builtins.diagnostics.chktex,
--					null_ls.builtins.diagnostics.hadolint,
--					null_ls.builtins.diagnostics.yamllint,
--					null_ls.builtins.diagnostics.ansiblelint,
--					null_ls.builtins.code_actions.shellcheck,
--					-- null_ls.builtins.code_actions.gitsigns,
--					-- null_ls.builtins.formatting.stylua,
--					-- null_ls.builtins.completion.spell,
--				}}
--		end,
--	},
--	{
--		'simrat39/symbols-outline.nvim',
--		config = function()
--			require("youal.symbols")
--		end,
--	},
--	{
--		"ellisonleao/glow.nvim",
--		config = function()
--			require('glow').setup({
--				width_ratio = 1.0,
--				height_ratio = 1.0,
--			})
--		end,
--		cmd = "Glow"
--	},
--	{
--		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--		config = function()
--			vim.diagnostic.config({virtual_text = false,})
--			require("lsp_lines").setup()
--		end,
--	},
--	{
--		'hrsh7th/nvim-cmp',
--		dependencies = {
--			'hrsh7th/cmp-nvim-lsp',
--			'hrsh7th/cmp-buffer',
--			'saadparwaiz1/cmp_luasnip',
--		},
--		config = function()
--			local cmp = require'cmp'
--
--			cmp.setup({
--				snippet = {
--					-- REQUIRED - you must specify a snippet engine
--					expand = function(args)
--						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--					end,
--				},
--				-- window = {
--					-- 	-- completion = cmp.config.window.bordered(),
--					-- 	-- documentation = cmp.config.window.bordered(),
--					-- },
--					mapping = cmp.mapping.preset.insert({
--						['<C-b>'] = cmp.mapping.scroll_docs(-4),
--						['<C-f>'] = cmp.mapping.scroll_docs(4),
--						['<C-Space>'] = cmp.mapping.complete(),
--						['<C-e>'] = cmp.mapping.abort(),
--						['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--					}),
--					sources = cmp.config.sources({
--						{ name = 'nvim_lsp' },
--						-- { name = 'vsnip' }, -- For vsnip users.
--						{ name = 'luasnip' }, -- For luasnip users.
--						-- { name = 'ultisnips' }, -- For ultisnips users.
--						-- { name = 'snippy' }, -- For snippy users.
--					}, {
--						{ name = 'buffer' },
--					})
--				})
--
--			end,
--		},
--		{
--			"folke/trouble.nvim",
--			dependencies = "nvim-tree/nvim-web-devicons",
--			config = function()
--				require("trouble").setup {
--					-- your configuration comes here
--					-- or leave it empty to use the default settings
--					-- refer to the configuration section below
--				}
--			end
--		},
--		{
--			'lewis6991/gitsigns.nvim',
--			config = function()
--				require("gitsigns").setup {
--					on_attach = function(bufnr)
--						local gs = package.loaded.gitsigns
--
--						local function map(mode, l, r, opts)
--							opts = opts or {}
--							opts.buffer = bufnr
--							vim.keymap.set(mode, l, r, opts)
--						end
--
--						-- Navigation
--						map('n', ']c', function()
--							if vim.wo.diff then return ']c' end
--							vim.schedule(function() gs.next_hunk() end)
--							return '<Ignore>'
--						end, {expr=true})
--
--						map('n', '[c', function()
--							if vim.wo.diff then return '[c' end
--							vim.schedule(function() gs.prev_hunk() end)
--							return '<Ignore>'
--						end, {expr=true})
--
--						-- Actions
--						map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
--						map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
--						map('n', '<leader>hS', gs.stage_buffer)
--						map('n', '<leader>hu', gs.undo_stage_hunk)
--						map('n', '<leader>hR', gs.reset_buffer)
--						map('n', '<leader>hp', gs.preview_hunk)
--						map('n', '<leader>hb', function() gs.blame_line{full=true} end)
--						map('n', '<leader>tb', gs.toggle_current_line_blame)
--						map('n', '<leader>hd', gs.diffthis)
--						map('n', '<leader>hD', function() gs.diffthis('~') end)
--						map('n', '<leader>td', gs.toggle_deleted)
--
--						-- Text object
--						map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--					end
--				}
--			end
--		},
--		{
--			"folke/twilight.nvim",
--			config = function()
--				require("twilight").setup {
--					-- your configuration comes here
--					-- or leave it empty to use the default settings
--					-- refer to the configuration section below
--				}
--			end
--		},
--		{
--			"nvim-telescope/telescope-file-browser.nvim",
--			dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
--		},
--		{
--			"AckslD/nvim-neoclip.lua",
--			dependencies = {
--				---@diagnostic disable-next-line: assign-type-mismatch
--				{'kkharji/sqlite.lua', module = 'sqlite'},
--				-- you'll need at least one of these
--				{'nvim-telescope/telescope.nvim'},
--				-- {'ibhagwan/fzf-lua'},
--			},
--			config = function()
--				require('neoclip').setup()
--			end,
--		},
--		{
--			'phaazon/hop.nvim',
--			branch = 'v2', -- optional but strongly recommended
--			config = function()
--				require'hop'.setup {}
--			end
--		},
--		{ 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
--		{
--			'ray-x/lsp_signature.nvim',
--			config = function()
--				require "lsp_signature".setup()
--			end,
--		},
--		{
--			'kosayoda/nvim-lightbulb',
--			dependencies = 'antoinemadec/FixCursorHold.nvim',
--			config = function()
--				require('nvim-lightbulb').setup({autocmd = {enabled = true}})
--			end
--		},
--		{
--			'L3MON4D3/LuaSnip',
--			config = function()
--				-- Use Tab (or some other key if you prefer) to trigger visual selection
--				require('neoclip').setup({
--					store_selection_keys = "y",
--				})
--				require("luasnip").config.set_config({
--					store_selection_keys = "<Tab>",
--				})
--			end,
--		},
--		'tpope/vim-fugitive',
--		'lukas-reineke/indent-blankline.nvim',
--		'famiu/bufdelete.nvim',
--		'junegunn/goyo.vim',
--		'wellle/targets.vim',
--		'andymass/vim-matchup',
--		'preservim/tagbar',
--		'ludovicchabant/vim-gutentags',
--		'mhinz/vim-grepper',
		'nvim-treesitter/nvim-treesitter-context',
		'tpope/vim-eunuch',
		'bronson/vim-trailing-whitespace',
		-- 'ntpeters/vim-better-whitespace',
		'godlygeek/tabular' ,
		'linty-org/readline.nvim',
		'bfredl/nvim-ipy',
	})

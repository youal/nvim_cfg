require'nvim-treesitter.configs'.setup {
	incremental_selection = {
		enable = true,
		keymaps = {
			-- in normal mode, start incremental selection.
			init_selection = "gnn",

			-- in visual mode, increment to the upper named parent.
			node_incremental = "grn",

			-- in visual mode, increment to the upper scope.
			scope_incremental = "grc",

			-- in visual mode, decrement to the previous named node.
			node_decremental = "grm",
		},
	},

	-- Automatically install missing parsers when entering buffer
	auto_install = false,

	-- I do not see the difference.
	-- highlight = {
	-- enable = true,
	-- -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- -- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- -- Instead of true it can also be a list of languages
	-- additional_vim_regex_highlighting = false,
	-- },

	-- Does not work well with if/elif/else in Python as of July 2022.
	-- Still expereimental.
	-- indent = {
	-- 	enable = true
	-- },

	-- Used by nvim-treesitter/nvim-treesitter-textobjects.
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
			lsp_interop = {
				enable = true,
				border = 'none',
				peek_definition_code = {
					["<leader>df"] = "@function.outer",
					["<leader>dF"] = "@class.outer",
				},
			},
		},
	},

	-- Used by nvim-neorg/neorg.
	ensure_installed = { "norg", --[[ other parsers you would wish to have ]] },
	highlight = { -- Be sure to enable highlights if you haven't!
		enable = true,
	},

	-- Used by p00f/nvim-ts-rainbow.
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},

	-- Used by JoosepAlviste/nvim-ts-context-commentstring
	context_commentstring = {
		enable = true
	},

	-- Used by andymass/vim-matchup.
	matchup = {
		enable = true,              -- mandatory, false will disable the whole extension
	},
}

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])

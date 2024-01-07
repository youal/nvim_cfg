require('telescope').setup {}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n',
	'<leader>fc',
	function() vim.cmd('Telescope diagnostics') end, {})

vim.keymap.set('n',
	'<leader>fd',
	function() vim.cmd('Telescope lsp_definitions') end, {})

vim.keymap.set('n',
	'<leader>fr',
	function() vim.cmd('Telescope lsp_references') end, {})

vim.keymap.set('n',
	'<leader>ft',
	function() vim.cmd('Telescope lsp_typ_definitions') end, {})

vim.keymap.set('n',
	'<leader>fj',
	function() vim.cmd('Telescope jumplist') end, {})

vim.keymap.set(
	'n',
	'<leader>fw',
	function() vim.cmd("Telescope workspaces") end, {})

vim.keymap.set(
	'n',
	'<leader>fi',
	function() vim.cmd("Telescope lsp_implementations") end, {})

vim.keymap.set(
	'n',
	'<leader>fD',
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

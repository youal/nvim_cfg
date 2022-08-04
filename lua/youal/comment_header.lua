local map = vim.api.nvim_set_keymap
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd
local coment_header = vim.api.nvim_create_augroup('coment_header', {clear = true})

create_autocmd('FileType', {
	pattern = 'perl,yaml,tmux',
	group = coment_header,
	callback = function()
		map('n', '<Leader>b',
		'i################################################################################<C-m><C-m>###############################################################################<Esc>kA ',
		{})
	end
})

create_autocmd('FileType', {
	pattern = 'lua',
	group = coment_header,
	callback = function()
		map('n', '<Leader>b',
		'i--------------------------------------------------------------------------------<C-m><C-m>------------------------------------------------------------------------------<Esc>kA',
		{})
	end
})

create_autocmd('FileType', {
	pattern = 'python,sh',
	group = coment_header,
	callback = function()
		map('n', '<Leader>b',
		'i################################################################################<C-m># <C-m>################################################################################<Esc>kA',
		{})
	end
})

create_autocmd('FileType', {
	pattern = 'sql',
	group = coment_header,
	callback = function()
		map('n', '<Leader>b',
		'i--------------------------------------------------------------------------------<C-m>- <C-m>--------------------------------------------------------------------------------<Esc>kA' ,
		{})
	end
})


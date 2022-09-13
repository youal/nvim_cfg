local map = vim.api.nvim_set_keymap
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd
local comment_header = vim.api.nvim_create_augroup('comment_header', {clear = true})

create_autocmd('FileType', {
	pattern = 'perl,yaml,tmux',
	group = comment_header,
	callback = function()
		map('n', '<Leader>b',
		'i################################################################################<C-m> ',
		{})
	end
})

create_autocmd('FileType', {
	pattern = 'lua',
	group = comment_header,
	callback = function()
		map('n', '<Leader>b',
		'i--------------------------------------------------------------------------------<C-m> ',
		{})
	end
})

create_autocmd('FileType', {
	pattern = 'python,sh',
	group = comment_header,
	callback = function()
		map('n', '<Leader>b',
		'i################################################################################<C-m># ',
		{})
	end
})

create_autocmd('FileType', {
	pattern = 'sql',
	group = comment_header,
	callback = function()
		map('n', '<Leader>b',
		'i--------------------------------------------------------------------------------<C-m>-- ' ,
		{})
	end
})


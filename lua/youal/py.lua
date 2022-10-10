
local map = vim.api.nvim_set_keymap
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd


local comment_settings = vim.api.nvim_create_augroup('comment_settings', {clear = true})
create_autocmd('FileType', {
	pattern = 'python',
	group = comment_settings,
	callback = function()
		vim.opt.formatoptions:append 'r'
	end
})


local shebang = vim.api.nvim_create_augroup('shebang', {clear = true})
create_autocmd('FileType', {
	pattern = 'python',
	group = shebang,
	callback = function()
		map('n', '<Leader>sb',
		'i#! /usr/bin/env python<C-m><C-m><C-m>',
		{})
	end
})

	-- command = 'set tabstop=4; set shiftwidth=4'

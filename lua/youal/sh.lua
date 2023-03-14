local map = vim.api.nvim_set_keymap
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd
local tab_settings = vim.api.nvim_create_augroup('tab_settings', {clear = true})

create_autocmd('FileType', {
	pattern = 'sh',
	group = tab_settings,
	command = 'set tabstop=4 | set shiftwidth=4'
})

local shebang = vim.api.nvim_create_augroup('shebang', {clear = true})
create_autocmd('FileType', {
	pattern = 'sh',
	group = shebang,
	callback = function()
		map('n', '<Leader>sb',
		'i#! /usr/bin/env bash<C-m><C-m><C-m>',
		{})
	end
})

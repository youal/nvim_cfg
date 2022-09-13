local map = vim.api.nvim_set_keymap
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd
local tab_settings = vim.api.nvim_create_augroup('tab_settings', {clear = true})

create_autocmd('FileType', {
	pattern = 'sh',
	group = tab_settings,
	command = 'set tabstop=4 | set shiftwidth=4'
})

	-- command = 'set tabstop=4; set shiftwidth=4'

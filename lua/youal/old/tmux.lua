local map = vim.api.nvim_set_keymap
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd
local formatoptions = vim.api.nvim_create_augroup('formatoptions', {clear = true})

create_autocmd('FileType', {
	pattern = 'tmux',
	group = formatoptions,
	callback = function()
		vim.opt.formatoptions:append 'r'
		vim.opt.formatoptions:append 'o'
	end
})

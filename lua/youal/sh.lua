local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd('FileType', {
	pattern = 'sh',
	command = 'set formatoptions=1jpcqr'
})

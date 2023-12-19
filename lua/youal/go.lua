local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd('FileType', {
	pattern = 'go',
	callback = function()
		local root_dir = vim.fs.dirname(
			vim.fs.find({ 'go.mod', 'go.work', '.git' },
			{
				upward = true,
				stop = vim.loop.os_homedir(),
				path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
			})[1])

		local lsp_server_id = vim.lsp.start({
			name = 'gopls',
			cmd = {'gopls'},
			root_dir = root_dir})

		vim.lsp.buf_attach_client(0, lsp_server_id)
	end
})

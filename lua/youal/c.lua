local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd('FileType', {
	pattern = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
	callback = function()
		local root_files = {
			'.clangd',
			'.clang-tidy',
			'.clang-format',
			'compile_commands.json',
			'compile_flags.txt',
			'configure.ac', -- AutoTools
		}

		local root_dir = vim.fs.dirname(
			vim.fs.find(root_files,
			{
				upward = true,
				stop = vim.loop.os_homedir(),
				path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
			})[1])

		local lsp_server_id = vim.lsp.start({
			name = 'clangd',
			cmd = {'clangd'},
			root_dir = root_dir
		})

		vim.lsp.buf_attach_client(0, lsp_server_id)
	end
})

local map = vim.keymap
local create_autocmd = vim.api.nvim_create_autocmd


function create_shebang_auto_cmd(args)
	create_autocmd('FileType', {
		pattern = args['filetype'],
		callback = function()
			map.set('n', '<Leader>sb',
			'i#! /usr/bin/env ' .. args['interpreter'] .. '<C-[>o<C-m><C-m>',
		-- '<cmd>write | Chmod u+x<Cr>i#! /usr/bin/env sh<C-[>o<C-m><C-m>',
			{})
		end
	})
end
-- <cmd>silent write | Chmod u+x<Cr>


local shebang_settings = {
	sh = {filetype = 'sh', interpreter = 'sh'},
	python = {filetype = 'python', interpreter = 'python3'},
	lua = {filetype = 'lua', interpreter = 'luajit'},
}

for i, v in pairs(shebang_settings) do
	create_shebang_auto_cmd(v)
end

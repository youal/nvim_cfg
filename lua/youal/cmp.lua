local cmp = require'cmp'

cmp.setup({
	-- Having it triggered automaticaly every time is annoying.
	completion = {
		autocomplete = false
	},

	-- To have a wider menu showing information like
	-- "Class", "Function", ...
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),

	sources = cmp.config.sources(
	{ { name = 'nvim_lsp' }, },

	{{ name = 'path' }},
	-- For suggestions in insert mode.
	{ { name = 'buffer' },})})


-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp')
-- 			.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require('lspconfig')['pyright'].setup {capabilities = capabilities}
-- require'lspconfig'.jedi_language_server.setup{
-- 	capabilities = capabilities
-- }
-- require'lspconfig'.pylsp.setup{
-- 	capabilities = capabilities
-- }


-- Use lsp to get suggestions when searching with /.
-- Ex: Suggest names of functions, classes, ...
cmp.setup.cmdline(
	'/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources(
		{{ name = 'nvim_lsp_document_symbol' }},
		{{ name = 'buffer' }})})

cmp.setup.cmdline(
	':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {{ name = 'cmdline' }}})

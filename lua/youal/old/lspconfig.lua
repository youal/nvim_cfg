-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	-- Generate error messages
	-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- require'lspconfig'.jsonls.setup{
--     on_attach = on_attach,
-- }

-- Extremely heavy (node js).
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
-- }

-- require'lspconfig'.jedi_language_server.setup{
--     on_attach = on_attach,
-- }


-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

local nvim_lsp = require('lspconfig')
-- nvim_lsp.pylsp.setup {
--   on_attach = function(client)
--     -- Configure pylsp linters
--     client.resolved_capabilities.document_formatting = true
--     client.resolved_capabilities.document_range_formatting = true
--     client.resolved_capabilities.code_lens = false
--
--     -- Specify the linters
--     client.settings = {
-- require'lspconfig'.pylsp.setup{
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				-- pydocstyle = {
-- 				-- 	enabled = true,
-- 				-- },
-- 				pycodestyle = {
-- 					ignore = {'E701', 'E122', 'E123', 'E126', 'E501', 'W503'},
-- 					enabled = false,
-- 				},
-- 				pyflakes = {
-- 					enabled = true,
-- 				},
-- 				pylint = {
-- 					enabled = false,
-- 				},
-- 				-- mypy = {
-- 				-- 	enabled = true,
-- 				-- },
-- 				-- flake8 = {
-- 				-- 	enabled = true,
-- 				-- },
-- 				-- yapf = {
-- 				-- 	enabled = true,
-- 				-- },
-- 				-- autoflake = {
-- 				-- 	enabled = true,
-- 				-- },
-- 				-- pylama = {
-- 				-- 	enabled = true,
-- 				-- },
-- 				-- autopep8 = {
-- 				-- 	enabled = true,
-- 				-- },
-- 			},
-- 		},
-- 	}
-- }

-- require'lspconfig'.pyre.setup{
--     on_attach = on_attach,
-- }

-- Python
require'lspconfig'.ruff_lsp.setup{
	on_attach = on_attach,
	-- capabilities = capabilities,
}

require'lspconfig'.gopls.setup{
	on_attach = on_attach,
	-- capabilities = capabilities,
}

-- require'lspconfig'.lua_ls.setup {
-- 	on_attach = on_attach,
-- 	-- capabilities = capabilities,
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Tell the language server which version of
-- 				-- Lua you're using (most likely LuaJIT in the
-- 				-- case of Neovim)
-- 				version = 'LuaJIT',
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = {'vim', 'use'},
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = vim.api.nvim_get_runtime_file("", true),
-- 			},
-- 			-- Do not send telemetry data containing a randomized but unique identifier
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- }

-- require("clangd_extensions").setup({
--     server = {on_attach = on_attach,}
-- })

require'lspconfig'.clangd.setup{
	on_attach = on_attach,
	-- capabilities = capabilities,
}

-- Works only in a git repositry. Need to set "root_dir" ?
require'lspconfig'.jsonnet_ls.setup{
	on_attach = on_attach,
	-- capabilities = capabilities,
}

local p = os.getenv("HOME")
	.. "/Downloads/github/groovy-language-server/build/libs/groovy-language-server-all.jar"
-- require'lspconfig'.groovyls.setup{
-- 	on_attach = on_attach,
-- 	-- capabilities = capabilities,
-- 	cmd = { "java", "-jar", p },
-- }

-- Setup lspconfig.
-- local nvim_lsp = require('lspconfig')
--
-- nvim_lsp['gopls'].setup{
--   cmd = {'gopls'},
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     gopls = {
--       experimentalPostfixCompletions = true,
--       analyses = {
--         unusedparams = true,
--         shadow = true,
--       },
--       staticcheck = true,
--     },
--   },
--   init_options = {
--     usePlaceholders = true,
--   }
-- }

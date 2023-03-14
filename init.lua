require("youal.plugins")
require("youal.map")
require("youal.readline")

local bo = vim.bo	-- buffer
local wo = vim.wo	-- window
local o = vim.o		-- general

-- Usefull to search recursivelly for a file with "find" withing the cwd.
-- bo.path = bo.path .. ",./**"
vim.opt.path:append '**'
-- vim.opt.formatoptions:append 'o'
-- bo.complete = bo.complete .. ",kspell"
bo.textwidth = 79

bo.tabstop = 8
bo.softtabstop = bo.tabstop
bo.shiftwidth = bo.tabstop
o.shiftround = true

wo.number = true
wo.relativenumber = true
wo.cursorline = true
-- wo.linebreak = true
-- Use treesiter instead
-- wo.foldmethod = "syntax"
wo.scrolloff = 1

-- o.foldlevelstart = 1
o.smartcase = true
o.termguicolors = true

o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- To ignore some files.
-- o.wildignore =

-- Might be usefull to adapt for some languages.
-- set formatoptions=cqjr1p
-- set formatprg=fmt

-- Has to be loaded before any other modules.
-- require('impatient')

-- require("youal.packer")
-- require("youal.ale")
-- require('hlargs').setup()
-- require("youal.neorg")
-- require('pqf').setup()
-- require"gitlinker".setup()
-- require("youal.autopairs")
-- require("youal.cmp")
-- require'colorizer'.setup()
-- require('nvim-ts-autotag').setup()
-- require("youal.color-picker")
-- require("youal.tagbar")
-- require("youal.tmux")
-- require("youal.sh")
-- require("youal.py")

vim.cmd([[
au BufRead,BufNewFile *.libsonnet set filetype=jsonnet
au FileType jsonnet set tabstop=8 | set shiftwidth=8
au FileType lisp set tabstop=2 | set shiftwidth=2
au BufRead,BufNewFile *.ms set filetype=nroff

" Eexpand and jump through snippets
imap <silent><expr> <C-d> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<C-d>'

" Jump backwards through snippets
" Uses "select" mode and not "visual" mode
imap <silent><expr> <A-p> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<A-p>'
smap <silent><expr> <A-p> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<A-p>'

imap <silent><expr> <A-n> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<A-n>'
smap <silent><expr> <A-n> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<A-n>'

" Cycle forward through choice nodes with Control-f (for example)
imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]])
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

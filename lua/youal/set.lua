local bo = vim.bo	-- buffer
local wo = vim.wo	-- window
local o = vim.o		-- general
local opt = vim.opt

-- Usefull to search recursivelly for a file with "find" withing the cwd.
-- bo.path = bo.path .. ",./**"
opt.path:append '**'
-- opt.formatoptions:append 'o'
-- bo.complete = bo.complete .. ",kspell"
bo.textwidth = 79

bo.tabstop = 8
bo.softtabstop = bo.tabstop
bo.shiftwidth = bo.tabstop
o.shiftround = true

-- opt.smartindent = true
-- opt.cindent = true

wo.number = true
wo.relativenumber = true
wo.cursorline = true
wo.linebreak = true
wo.list = true
-- Use treesiter instead
-- wo.foldmethod = "syntax"

-- o.foldlevelstart = 1
o.smartcase = true
o.termguicolors = true
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
o.laststatus = 0
o.showmode = false

opt.formatoptions = {
	[1] = true,
	j = true,
	p = true,
	c = true,
	q = true,
	r = true,
}
-- set formatprg=fmt

opt.wildignore:append({
	'*.o',
	'*.a',
	'__pycache__',
})

vim.cmd([[
let mapleader = " "
]])

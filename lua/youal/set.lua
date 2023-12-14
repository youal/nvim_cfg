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
-- wo.linebreak = true
-- Use treesiter instead
-- wo.foldmethod = "syntax"
wo.scrolloff = 8

-- o.foldlevelstart = 1
o.smartcase = true
o.termguicolors = true

o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- To ignore some files.
-- o.wildignore =

-- Might be usefull to adapt for some languages.
-- set formatoptions=cqjr1p
-- set formatprg=fmt

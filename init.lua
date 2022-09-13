vim.cmd([[
" Use <C-x><C-u> to complete with words coming from Tmux.
let g:tmuxcomplete#trigger = 'completefunc'
let g:snipMate = { 'snippet_version' : 1 }

" Do not start the server when opening a Mardown file.
" Instead, use the commend ComposerStart.
" let g:markdown_composer_autostart = 0

" au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" filetype plugin indent on

" Highhlight the columns on the right in a different colour.
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

colorscheme cinnabar
]])

local bo = vim.bo	-- buffer
local wo = vim.wo	-- window
local o = vim.o		-- general

-- Usefull to search recursivelly for a file with "find" withing the cwd.
-- bo.path = bo.path .. ",./**"
vim.opt.path:append '**'
vim.opt.formatoptions:append 'o'
bo.complete = bo.complete .. ",kspell"
bo.textwidth = 78

bo.tabstop = 4
bo.softtabstop = bo.tabstop
bo.shiftwidth = bo.tabstop

wo.number = true
wo.relativenumber = true
wo.cursorline = true
wo.linebreak = true
wo.foldmethod = "syntax"
wo.scrolloff = 1

o.foldlevelstart = 1
o.smartcase = true
o.termguicolors = true
o.shiftround = true
-- To ignore some files.
-- o.wildignore =

-- Might be usefull to adapt for some languages.
-- set formatoptions=cqjr1p
-- set formatprg=fmt

-- Has to be loaded before any other modules.
require('impatient')

require("youal.packer")
require("youal.ale")
require("youal.comment_header")
require("youal.map")
require("youal.treesitter")
require('hlargs').setup()
require("youal.lspconfig")
require("youal.symbols")
require("youal.neorg")
require'hop'.setup()
-- require("youal.readline")
require('pqf').setup()
require"gitlinker".setup()
-- require("youal.autopairs")
require("youal.cmp")
require('tabline').setup({})
require'colorizer'.setup()
require('nvim-ts-autotag').setup()
require("youal.color-picker")
require("youal.true_zen")
require("youal.tagbar")
require("youal.tmux")
require("youal.sh")

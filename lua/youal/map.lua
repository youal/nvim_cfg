local map = vim.api.nvim_set_keymap


map('n', '<S-Tab>', ':tabprevious<CR>', {})
map('n', '<Tab>', ':tabnext<CR>', {})

-- To escape the insert/terminal mode more easily.
map('t', '<Esc>', '<C-\\><C-n>', {})
map('n', ']oh', ':nohl<CR>', {})

map('n', '[os', ':set spell<CR>', {})
map('n', ']os', ':set nospell<CR>', {})

map('n', '[ol', ':set list<CR>', {})
map('n', ']ol', ':set nolist<CR>', {})

map('n', '[q', ':cprevious<CR>', {})
map('n', ']q', ':cnext<CR>', {})

map('n', '[<Space>', 'O<Esc>j', {})
map('n', ']<Space>', 'o<Esc>k', {})

map('n', '<Leader>dt', ':diffthis<CR>', {})
map('n', '<Leader>dg', ':diffget<CR>', {})
map('n', '<Leader>dp', ':diffput<CR>', {})

map('n', '[ll', ':let &colorcolumn=join(range(82,999),",")<CR>', {})
map('n', ']ll', ':let &colorcolumn=""<CR>', {})

map('n', '<F3>', 'a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>', {})
map('i', '<F3>', '<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>', {})

-- map('n', '<Leader>nc', ':set background=dark<CR>:CycleColorNext<CR>', {})

map('n', '<Leader>hp', ':HopPattern<CR>', {})
map('n', '<Leader>gs', ':Git<CR>', {})

map('n', '<Leader>sr', ':SignifyRefresh<CR>', {})
map('n', '<Leader>sd', ':SignifyHunkDiff<CR>', {})
map('n', '<Leader>su', ':SignifyHunkUndo<CR>', {})

map('n', '<Leader>ss', '<Plug>SnipRun', {})
map('n', '<Leader>so', '<Plug>SnipRunOperator', {})

map('n', '<Leader>rr', '<Plug>RestNvim', {})
map('n', '<Leader>rp', '<Plug>RestNvimPreview', {})

map('i', '<C-x><C-o>', "<Cmd>lua require('cmp').complete()<CR>", {})

map('n', 'gs', '<plug>(GrepperOperator)', {})
map('n', 'gs', '<plug>(GrepperOperator)', {})

map('n', '<Leader>af', ':lua require("harpoon.mark").add_file()<CR>', {})
map('n', '<Leader>fl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
map('n', '<Leader>fn', ':lua require("harpoon.ui").nav_next()<CR>', {})
map('n', '<Leader>fp', ':lua require("harpoon.ui").nav_prev()<CR>', {})

map('n', '[e', '<Plug>(ale_previous_wrap)', {})
map('n', ']e', '<Plug>(ale_next_wrap)', {})

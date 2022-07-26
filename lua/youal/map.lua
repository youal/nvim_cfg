local map = vim.api.nvim_set_keymap


map('n', '<Tab>', 'gt', {})
map('n', '<S-Tab>', 'gT', {})

map('n', ']hl', ':nohl<CR>', {})
map('n', '<Leader>nc', ':set background=dark<CR>:CycleColorNext<CR>', {})

map('n', '<Leader>hp', ':HopPattern<CR>', {})
map('n', '<Leader>gs', ':Git<CR>', {})

map('n', '<Leader>sr', ':SignifyRefresh<CR>', {})
map('n', '<Leader>sd', ':SignifyHunkDiff<CR>', {})
map('n', '<Leader>su', ':SignifyHunkUndo<CR>', {})

map('n', '[ll', ':let &colorcolumn=join(range(82,999),",")<CR>', {})
map('n', ']ll', ':let &colorcolumn=""<CR>', {})

-- To escape the insert/terminal mode more easily.
map('t', '<Esc>', '<C-\\><C-n>', {})

map('n', '<F3>', 'a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>', {})
map('i', '<F3>', '<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>', {})

map('i', '<C-x><C-o>', "<Cmd>lua require('cmp').complete()<CR>", {})

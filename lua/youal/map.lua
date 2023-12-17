-- local map.set = vim.api.nvim_set_keymap
local map = vim.keymap

map.set('n', '<leader>d', '"_d')
map.set('n', '<leader>c', '"_c')
map.set('n', '<leader>y', '"+y')
map.set('n', '<leader>p', '"+p')

map.set('n', '<leader>s', ':% substitute /<C-r>w/g<Left><Left>')
map.set('n', '<leader>x', ':silent ! chmod u+x %<Cr>')

map.set('v', '.', ':normal .<CR>')

map.set('n', '<S-Tab>', ':tabprevious<CR>', {})
map.set('n', '<Tab>', ':tabnext<CR>', {})

-- To escape the insert/terminal mode more easily.
map.set('t', '<Esc>', '<C-\\><C-n>', {})
map.set('n', ']oh', ':nohlsearch<CR>', {})

map.set('n', '[os', ':set spell<CR>', {})
map.set('n', ']os', ':set nospell<CR>', {})

map.set('n', '[ol', ':set list<CR>', {})
map.set('n', ']ol', ':set nolist<CR>', {})

map.set('n', '[q', ':cprevious<CR>', {})
map.set('n', ']q', ':cnext<CR>', {})

map.set('n', '<Leader>dt', ':diffthis<CR>', {})
map.set('n', '<Leader>dg', ':diffget<CR>', {})
map.set('n', '<Leader>dp', ':diffput<CR>', {})

map.set('n', '[ll', ':let &colorcolumn=join(range(72,999),",")<CR>', {})
map.set('n', ']ll', ':let &colorcolumn=""<CR>', {})

map.set('n', '<F3>', 'a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>', {})
map.set('i', '<F3>', '<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>', {})

-- map.set('n', '<Leader>nc', ':set background=dark<CR>:CycleColorNext<CR>', {})
-- map.set('i', '<C-x><C-o>', "<Cmd>lua require('cmp').complete()<CR>", {})

-- Moves the selected lines down one line, while indenting them
map.set("v", "<C-j>", ":m '>+1<CR>gv=gv", {})
map.set("v", "<C-k>", ":m '<-2<CR>gv=gv", {})

-- Avoid to have the cursor moving when doing a join
map.set('n', 'J', 'mzJ`z', {noremap = true})
map.set('n', 'gJ', 'mzgJ`z', {noremap = true})

map.set('n', '<C-d>', '<C-d>zz', {})
map.set('n', '<C-u>', '<C-u>zz', {})
map.set('n', 'n', 'nzzzv', {})
map.set('n', 'N', 'Nzzzv', {})

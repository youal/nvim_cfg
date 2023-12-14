local map = vim.api.nvim_set_keymap


-- Usefull when need to replace what is selected by something stored in the
-- anonymous buffer
map('x', '<leader>p', '"_dp', {})

map('n', '<S-Tab>', ':tabprevious<CR>', {})
map('n', '<Tab>', ':tabnext<CR>', {})

map('n', '<Leader>cm', ':Neorg keybind all core.looking-glass.magnify-code-block<CR>', {})

-- To escape the insert/terminal mode more easily.
map('t', '<Esc>', '<C-\\><C-n>', {})
map('n', ']oh', ':nohl<CR>', {})

map('n', '[os', ':set spell<CR>', {})
map('n', ']os', ':set nospell<CR>', {})

map('n', '[ol', ':set list<CR>', {})
map('n', ']ol', ':set nolist<CR>', {})

map('n', '[q', ':cprevious<CR>', {})
map('n', ']q', ':cnext<CR>', {})

map('n', '<Leader>dt', ':diffthis<CR>', {})
map('n', '<Leader>dg', ':diffget<CR>', {})
map('n', '<Leader>dp', ':diffput<CR>', {})

map('n', '[ll', ':let &colorcolumn=join(range(72,999),",")<CR>', {})
map('n', ']ll', ':let &colorcolumn=""<CR>', {})

map('n', '<F3>', 'a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>', {})
map('i', '<F3>', '<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>', {})

-- map('n', '<Leader>nc', ':set background=dark<CR>:CycleColorNext<CR>', {})

map('n', '<Leader>hp', ':HopPattern<CR>', {})

map('i', '<C-x><C-o>', "<Cmd>lua require('cmp').complete()<CR>", {})

-- Moves the selected lines down one line, while indenting them
map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})

-- Avoid to have the cursor moving when doing a join
map('n', 'J', 'mzJ`z', {noremap = true})

map('n', '<C-d>', '<C-d>zz', {})
map('n', '<C-u>', '<C-u>zz', {})
map('n', 'n', 'nzzzv', {})
map('n', 'N', 'Nzzzv', {})

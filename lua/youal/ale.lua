vim.cmd([[
" Shows the number of errors and warnings in the statusline when using ALE.
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
]])

vim.g.ale_disable_lsp = 1
vim.g.ale_linters_explicit = 1

vim.g.ale_linters = {
   sh = {'shellcheck'},
   python = {'bandit'},
   lua = {'luac'},
}

vim.g.ale_fixers = {
   python = {'reorder-python-imports'},
}

let g:better_whitespace_enabled=1
let g:better_whitespace_filetypes_blacklist=['diff', 'far','gitcommit', 'unite', 'qf', 'help','markdown','calendar','dashboard']
let g:better_whitespace_filetypes_blacklist+=['minimap']
nnoremap <silent><m-w> :StripWhitespace<cr>
let g:better_whitespace_operator='<m-w>'


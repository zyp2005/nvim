noremap <silent><space><F3> :AsyncTask file-build<cr>
noremap <silent><space><F5> :AsyncTask file-run<cr>
noremap <M-q> :cclose<cr>
let g:asyncrun_open = 6
let g:asynctasks_term_pos = 'right'
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80



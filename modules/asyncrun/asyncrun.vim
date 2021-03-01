" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <m-q> :call asyncrun#quickfix_toggle(6)<cr>
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
" 任务结束时候响铃提醒
" let g:asyncrun_bell = 1

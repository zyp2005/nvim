noremap <space>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
autocmd FileType undo nnoremap <buffer> u <plug>UndotreeNextState
autocmd FileType undo nnoremap <buffer> e <plug>UndotreePreviousState
autocmd FileType undo nnoremap <buffer> U 5<plug>UndotreeNextState
autocmd FileType undo nnoremap <buffer> E 5<plug>UndotreePreviousState


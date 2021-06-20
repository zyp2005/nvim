noremap <space>vv :Vista coc<CR>
noremap <space>vf :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
" let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_sidebar_width = 30
let g:vista_cursor_delay = 100 "显示详细信息延迟"`scroll
let g:vista_echo_cursor_strategy = 'both'
let g:vista_close_on_jump = 0
let g:vista_update_on_text_changed_delay = 1


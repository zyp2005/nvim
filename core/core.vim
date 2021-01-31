if &compatible
	" vint: -ProhibitSetNoCompatible
	set nocompatible
	" vint: +ProhibitSetNoCompatible
endif


" 初始化基本需求
if has('vim_starting')
	" 全局映射 "{{{
	" 使用空格键作为leader键,;作为第二leader键
	" 加载插件之前需要！
	let g:mapleader="\<Space>"
	let g:maplocalleader=';'

	" 释放键映射前缀，完全退出以使用插件.
	nnoremap <Space>  <Nop>
	xnoremap <Space>  <Nop>
	nnoremap ,        <Nop>
	xnoremap ,        <Nop>
	nnoremap ;        <Nop>
	xnoremap ;        <Nop>

endif

" call utils#source_file($VIM_PATH,'core/packman.vim')
" call utils#source_file($VIM_PATH,'core/general.vim')
" call utils#source_file($VIM_PATH,'core/filetype.vim')


" disable all keymaps of plugins
let g:thinkvim_disable_mappings = 0
" disable some plugins keymap
let g:thinkvim_disable_pmaping = []

" Load key map
call utils#source_file($VIM_PATH,'keybinds/keybinds.vim')

"theme

set secure

" vim: set ts=2 sw=2 tw=80 noet :

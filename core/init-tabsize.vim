"======================================================================
"
" init-tabsize.vim - 大部分人对 tabsize 都有自己的设置，改这里即可
"
" Created by zyp2005 on 2020/12/26
" Last Modified: 2018/05/30 22:05:44
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------

" 设置缩进宽度
set shiftwidth=4

" 设置 TAB 宽度
set tabstop=4

" 展开 tab (expandtab)
set expandtab

" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4

" 在新行上使用相同的缩进
set autoindent

 " 在新行上智能自动缩进
set smartindent

if exists('&breakindent')
	set breakindentopt=shift:4,min:20
endif

set whichwrap+=<,>,[,],~    " 移至某些键的下一行

augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	"au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END



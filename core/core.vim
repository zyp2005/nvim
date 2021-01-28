if &compatible
	" vint: -ProhibitSetNoCompatible
	set nocompatible
	" vint: +ProhibitSetNoCompatible
endif

" 将主配置目录设置为父目录
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let $THINKVIM = expand($HOME.'/.thinkvim.d')

" 设置用户配置文件
let s:user_init_config = expand($THINKVIM.'/init.vim')

" 加载插件
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1

let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

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

call utils#source_file($VIM_PATH,'core/packman.vim')
call utils#source_file($VIM_PATH,'core/general.vim')
call utils#source_file($VIM_PATH,'core/filetype.vim')

" Load user init config
call utils#check_source(s:user_init_config)

" disable all keymaps of plugins
let g:thinkvim_disable_mappings = 0
" disable some plugins keymap
let g:thinkvim_disable_pmaping = []

" Load key map
call utils#source_file($VIM_PATH,'keybinds/keybinds.vim')

" Initialize user favorite colorscheme
call theme#init()

if exists("*UserInit")
	call UserInit()
endif

set secure

" vim: set ts=2 sw=2 tw=80 noet :

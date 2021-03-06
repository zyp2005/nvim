"======================================================================
"
" init.vim - initialize config
"
" Created by zyp2005 on 2020/12/26
" Last Modified: 2021-04-03 20:46
"
"======================================================================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let $NVIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:path.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:path

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
" set rtp+=~/.vim

" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
LoadScript core/init-basic.vim

" 加载扩展配置
LoadScript core/init-config.vim

" 设定 tabsize
LoadScript core/init-tabsize.vim

" 自定义按键
LoadScript core/init-keymaps.vim

" 插件加载
LoadScript core/init-plugins.vim

"插件配置
LoadScript core/init-extra.vim

" 界面样式
LoadScript core/init-style.vim


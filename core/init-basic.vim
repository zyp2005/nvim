"======================================================================
"
" init-basic.vim - 基础配置，该配置需要兼容 vim tiny 模式
"
" 所有人都能接受的配置，不掺渣任何 keymap, 和偏好设置
"
" Created by zyp2005 on 2020/11/14
" Last Modified: 2020/11/14
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------



" 禁用 vi 兼容模式
set nocompatible

" 设置 Backspace 键模式
set bs=eol,start,indent

" 自动缩进
set autoindent

" 打开 C/C++ 语言缩进优化
set cindent

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

"长行不全部显示
set nowrap
set linebreak   " 在breakket的设置下打开回绕
set breakat=\ \	;:,!?           " 回绕默认字符

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" 显示光标位置
set ruler

let &t_ut=''
" 自动切换目录
set autochdir


"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch


"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------

if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

	scriptencoding utf-8
endif


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
	filetype indent on
	filetype plugin on
	filetype plugin indent on
	filetype plugin indent on
endif


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
" if has('syntax')
" 	syntax enable
" 	syntax on
" endif


"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

"为正则表达式打开magic
set magic                    " 为正则表达式打开magic

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=1

" 添加html括号以配对
set matchpairs+=<:>     " 添加html括号以配对

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<


" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
" set tags=./.tags;,.tags

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac

set softtabstop=4

"set ttimeoutlen=0 "键码使用不同的超时的值，设置 'ttiomeoutlen' 为非负数。
"set timeout timeoutlen=1000 ttimeoutlen=1000
"set notimeout

" 在每行前显示相对于光标所在的行的行号。
set relativenumber

" 高亮光标所在的文本行
set cursorline

" 光标上下两侧最少保留的屏幕行数
set scrolloff=4

" 允许鼠标
set mouse=a

"保存用于视图和会话的内容:
set viewoptions=cursor,folds,slash,unix

" 超过78个词换行
set tw=78

" 设置Vim缩短消息长度的标志位列表
set shortmess+=c

" 逗号分隔的选项列表，用于插入模式的补全
set completeopt=longest,noinsert,menuone,noselect,preview

" session
set sessionoptions+=globals


set ttyfast "should make scrolling faster

" 使用可视响铃代替鸣叫
set visualbell
set errorbells               " 触发错误提示


" 交换文件
" silent !mkdir -p ~/.config/nvim/tmp/backup
" silent !mkdir -p ~/.config/nvim/tmp/undo
" "silent !mkdir -p ~/.config/nvim/tmp/sessions
" set backupdir=~/.config/nvim/tmp/backup,.
" set directory=~/.config/nvim/tmp/backup,.
"
" if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.
" endif

" 显示第100列
"set colorcolumn=100


" 如果未设置“隐藏”，则TextEdit可能会失败。
set hidden

" 命令行使用的屏幕行数。
set cmdheight=1


" 允许可视列块模式的虚拟编辑。
set virtualedit=block

"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99

	set indentexpr=
endif


"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class


set wildignorecase
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android


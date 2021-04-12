-- ======================================================================
--
-- init-basic.vim - 基础配置，该配置需要兼容 vim tiny 模式
--
-- 所有人都能接受的配置，不掺渣任何 keymap, 和偏好设置
--
-- Created by zyp2005 on 2020/11/14
-- Last Modified: 2020/11/14
--
-- ======================================================================
-- vim: vim.o.ts=4 sw=4 tw=78 noet :
--
-- ----------------------------------------------------------------------
-- 基础设置
-- ----------------------------------------------------------------------

-- 禁用 vi 兼容模式
vim.o.compatible = false

-- 设置 Backspace 键模式
vim.o.bs = 'eol,start,indent'

-- 自动缩进
vim.o.autoindent = true

-- 打开 C/C++ 语言缩进优化
vim.o.cindent = true

-- Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
vim.o.winaltkeys='no'

--长行不全部显示
vim.o.wrap = true
vim.o.linebreak = true  -- 在breakket的设置下打开回绕
vim.o.breakat='\\	;:,!?'           -- 回绕默认字符

-- 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
vim.o.ttimeout = true

-- 功能键超时检测 50 毫秒
vim.o.ttimeoutlen = 50

-- 显示光标位置
vim.o.ruler = true

vim.o.t_ut=''
-- 自动切换目录
vim.o.autochdir = true


------------------------------------------------------------------------
-- 搜索设置
------------------------------------------------------------------------

-- 搜索时忽略大小写
vim.o.ignorecase = true

-- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
vim.o.smartcase = true

-- 高亮搜索内容
vim.o.hlsearch = true

-- 查找输入时动态增量显示查找结果
vim.o.incsearch = true


------------------------------------------------------------------------
-- 编码设置
------------------------------------------------------------------------

if has('multi_byte')
	-- 内部工作编码
	vim.o.encoding=utf-8

	-- 文件默认编码
	vim.o.fileencoding=utf-8

	-- 打开文件时自动尝试下面顺序的编码
	vim.o.fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

	scriptencoding utf-8
endif


------------------------------------------------------------------------
-- 允许 Vim 自带脚本根据文件类型自动设置缩进等
------------------------------------------------------------------------
if has('autocmd')
	filetype indent on
	filetype plugin on
	filetype plugin indent on
	filetype plugin indent on
endif


------------------------------------------------------------------------
-- 语法高亮设置
------------------------------------------------------------------------
-- if has('syntax')
-- 	syntax enable
-- 	syntax on
-- endif


------------------------------------------------------------------------
-- 其他设置
------------------------------------------------------------------------

--为正则表达式打开magic
vim.o.magic                    -- 为正则表达式打开magic

-- 显示匹配的括号
vim.o.showmatch

-- 显示括号匹配的时间
vim.o.matchtime=1

-- 添加html括号以配对
vim.o.matchpairs+=<:>     -- 添加html括号以配对

-- 显示最后一行
vim.o.display=lastline

-- 允许下方显示目录
vim.o.wildmenu

-- 延迟绘制（提升性能）
vim.o.lazyredraw

-- 错误格式
vim.o.errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

-- 设置分隔符可视
vim.o.listchars=tab:\|\ ,trail:.,extends:>,precedes:<


-- 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
-- 或者 Vim 当前目录包含 .tags 文件
-- vim.o.tags=./.tags;,.tags

-- 如遇Unicode值大于255的文本，不必等到空格再折行
vim.o.formatoptions+=m

-- 合并两行中文时，不在中间加空格
vim.o.formatoptions+=B

-- 文件换行符，默认使用 unix 换行符
vim.o.ffs=unix,dos,mac

vim.o.softtabstop=4

--vim.o.ttimeoutlen=0 "键码使用不同的超时的值，设置 'ttiomeoutlen' 为非负数。
--vim.o.timeout timeoutlen=1000 ttimeoutlen=1000
--vim.o.notimeout

-- 在每行前显示相对于光标所在的行的行号。
vim.o.relativenumber

-- 高亮光标所在的文本行
vim.o.cursorline

-- 光标上下两侧最少保留的屏幕行数
vim.o.scrolloff=4

-- 允许鼠标
vim.o.mouse=a

--保存用于视图和会话的内容:
vim.o.viewoptions=cursor,folds,slash,unix

-- 超过78个词换行
vim.o.tw=78

-- 设置Vim缩短消息长度的标志位列表
vim.o.shortmess+=c

-- 逗号分隔的选项列表，用于插入模式的补全
vim.o.completeopt=longest,noinsert,menuone,noselect,preview

-- session
vim.o.sessionoptions+=globals


vim.o.ttyfast --should make scrolling faster

-- 使用可视响铃代替鸣叫
vim.o.visualbell
vim.o.errorbells               -- 触发错误提示


-- 交换文件
-- silent !mkdir -p ~/.config/nvim/tmp/backup
-- silent !mkdir -p ~/.config/nvim/tmp/undo
-- "silent !mkdir -p ~/.config/nvim/tmp/sessions
-- vim.o.backupdir=~/.config/nvim/tmp/backup,.
-- vim.o.directory=~/.config/nvim/tmp/backup,.
--
-- if has('persistent_undo')
--	vim.o.undofile
--	vim.o.undodir=~/.config/nvim/tmp/undo,.
-- endif

-- 显示第100列
--vim.o.colorcolumn=100


-- 如果未设置“隐藏”，则TextEdit可能会失败。
vim.o.hidden

-- 命令行使用的屏幕行数。
vim.o.cmdheight=1


-- 允许可视列块模式的虚拟编辑。
vim.o.virtualedit=block

------------------------------------------------------------------------
-- 设置代码折叠
------------------------------------------------------------------------
if has('folding')
	-- 允许代码折叠
	vim.o.foldenable

	-- 代码折叠默认使用缩进
	vim.o.fdm=indent

	-- 默认打开所有缩进
	vim.o.foldlevel=99

	vim.o.indentexpr=
endif


------------------------------------------------------------------------
-- 文件搜索和补全时忽略下面扩展名
------------------------------------------------------------------------
vim.o.suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class


vim.o.wildignorecase
vim.o.wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib --stuff to ignore when tab completing
vim.o.wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
vim.o.wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    -- MacOSX/Linux
vim.o.wildignore+=*DS_Store*,*.ipch
vim.o.wildignore+=*.gem
vim.o.wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
vim.o.wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
vim.o.wildignore+=*/.nx/**,*.app,*.git,.git
vim.o.wildignore+=*.wav,*.mp3,*.ogg,*.pcm
vim.o.wildignore+=*.mht,*.suo,*.sdf,*.jnlp
vim.o.wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
vim.o.wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
vim.o.wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
vim.o.wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
vim.o.wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
vim.o.wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android


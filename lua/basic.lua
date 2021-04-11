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
-- vim: vim.api.nvim_set_option('ts=4 sw=4 tw=78 noet :
--
-- ----------------------------------------------------------------------
-- 基础设置
-- ----------------------------------------------------------------------

-- 禁用 vi 兼容模式
vim.api.nvim_set_option('compatible', false)

-- 设置 Backspace 键模式
vim.api.nvim_set_option('bs','eol,start,indent')

-- 自动缩进
vim.api.nvim_set_option('autoindent',true)

-- 打开 C/C++ 语言缩进优化
vim.api.nvim_set_option('cindent',true)

-- Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
vim.api.nvim_set_option('winaltkeys=no

--长行不全部显示
vim.api.nvim_set_option('nowrap
vim.api.nvim_set_option('linebreak   -- 在breakket的设置下打开回绕
vim.api.nvim_set_option('breakat=\ \	;:,!?           -- 回绕默认字符

-- 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
vim.api.nvim_set_option('ttimeout

-- 功能键超时检测 50 毫秒
vim.api.nvim_set_option('ttimeoutlen=50

-- 显示光标位置
vim.api.nvim_set_option('ruler

let &t_ut=''
-- 自动切换目录
vim.api.nvim_set_option('autochdir


------------------------------------------------------------------------
-- 搜索设置
------------------------------------------------------------------------

-- 搜索时忽略大小写
vim.api.nvim_set_option('ignorecase

-- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
vim.api.nvim_set_option('smartcase

-- 高亮搜索内容
vim.api.nvim_set_option('hlsearch

-- 查找输入时动态增量显示查找结果
vim.api.nvim_set_option('incsearch


------------------------------------------------------------------------
-- 编码设置
------------------------------------------------------------------------

if has('multi_byte')
	-- 内部工作编码
	vim.api.nvim_set_option('encoding=utf-8

	-- 文件默认编码
	vim.api.nvim_set_option('fileencoding=utf-8

	-- 打开文件时自动尝试下面顺序的编码
	vim.api.nvim_set_option('fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

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
vim.api.nvim_set_option('magic                    -- 为正则表达式打开magic

-- 显示匹配的括号
vim.api.nvim_set_option('showmatch

-- 显示括号匹配的时间
vim.api.nvim_set_option('matchtime=1

-- 添加html括号以配对
vim.api.nvim_set_option('matchpairs+=<:>     -- 添加html括号以配对

-- 显示最后一行
vim.api.nvim_set_option('display=lastline

-- 允许下方显示目录
vim.api.nvim_set_option('wildmenu

-- 延迟绘制（提升性能）
vim.api.nvim_set_option('lazyredraw

-- 错误格式
vim.api.nvim_set_option('errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

-- 设置分隔符可视
vim.api.nvim_set_option('listchars=tab:\|\ ,trail:.,extends:>,precedes:<


-- 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
-- 或者 Vim 当前目录包含 .tags 文件
-- vim.api.nvim_set_option('tags=./.tags;,.tags

-- 如遇Unicode值大于255的文本，不必等到空格再折行
vim.api.nvim_set_option('formatoptions+=m

-- 合并两行中文时，不在中间加空格
vim.api.nvim_set_option('formatoptions+=B

-- 文件换行符，默认使用 unix 换行符
vim.api.nvim_set_option('ffs=unix,dos,mac

vim.api.nvim_set_option('softtabstop=4

--vim.api.nvim_set_option('ttimeoutlen=0 "键码使用不同的超时的值，设置 'ttiomeoutlen' 为非负数。
--vim.api.nvim_set_option('timeout timeoutlen=1000 ttimeoutlen=1000
--vim.api.nvim_set_option('notimeout

-- 在每行前显示相对于光标所在的行的行号。
vim.api.nvim_set_option('relativenumber

-- 高亮光标所在的文本行
vim.api.nvim_set_option('cursorline

-- 光标上下两侧最少保留的屏幕行数
vim.api.nvim_set_option('scrolloff=4

-- 允许鼠标
vim.api.nvim_set_option('mouse=a

--保存用于视图和会话的内容:
vim.api.nvim_set_option('viewoptions=cursor,folds,slash,unix

-- 超过78个词换行
vim.api.nvim_set_option('tw=78

-- 设置Vim缩短消息长度的标志位列表
vim.api.nvim_set_option('shortmess+=c

-- 逗号分隔的选项列表，用于插入模式的补全
vim.api.nvim_set_option('completeopt=longest,noinsert,menuone,noselect,preview

-- session
vim.api.nvim_set_option('sessionoptions+=globals


vim.api.nvim_set_option('ttyfast --should make scrolling faster

-- 使用可视响铃代替鸣叫
vim.api.nvim_set_option('visualbell
vim.api.nvim_set_option('errorbells               -- 触发错误提示


-- 交换文件
-- silent !mkdir -p ~/.config/nvim/tmp/backup
-- silent !mkdir -p ~/.config/nvim/tmp/undo
-- "silent !mkdir -p ~/.config/nvim/tmp/sessions
-- vim.api.nvim_set_option('backupdir=~/.config/nvim/tmp/backup,.
-- vim.api.nvim_set_option('directory=~/.config/nvim/tmp/backup,.
--
-- if has('persistent_undo')
--	vim.api.nvim_set_option('undofile
--	vim.api.nvim_set_option('undodir=~/.config/nvim/tmp/undo,.
-- endif

-- 显示第100列
--vim.api.nvim_set_option('colorcolumn=100


-- 如果未设置“隐藏”，则TextEdit可能会失败。
vim.api.nvim_set_option('hidden

-- 命令行使用的屏幕行数。
vim.api.nvim_set_option('cmdheight=1


-- 允许可视列块模式的虚拟编辑。
vim.api.nvim_set_option('virtualedit=block

------------------------------------------------------------------------
-- 设置代码折叠
------------------------------------------------------------------------
if has('folding')
	-- 允许代码折叠
	vim.api.nvim_set_option('foldenable

	-- 代码折叠默认使用缩进
	vim.api.nvim_set_option('fdm=indent

	-- 默认打开所有缩进
	vim.api.nvim_set_option('foldlevel=99

	vim.api.nvim_set_option('indentexpr=
endif


------------------------------------------------------------------------
-- 文件搜索和补全时忽略下面扩展名
------------------------------------------------------------------------
vim.api.nvim_set_option('suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class


vim.api.nvim_set_option('wildignorecase
vim.api.nvim_set_option('wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib --stuff to ignore when tab completing
vim.api.nvim_set_option('wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
vim.api.nvim_set_option('wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    -- MacOSX/Linux
vim.api.nvim_set_option('wildignore+=*DS_Store*,*.ipch
vim.api.nvim_set_option('wildignore+=*.gem
vim.api.nvim_set_option('wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
vim.api.nvim_set_option('wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
vim.api.nvim_set_option('wildignore+=*/.nx/**,*.app,*.git,.git
vim.api.nvim_set_option('wildignore+=*.wav,*.mp3,*.ogg,*.pcm
vim.api.nvim_set_option('wildignore+=*.mht,*.suo,*.sdf,*.jnlp
vim.api.nvim_set_option('wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
vim.api.nvim_set_option('wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
vim.api.nvim_set_option('wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
vim.api.nvim_set_option('wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
vim.api.nvim_set_option('wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
vim.api.nvim_set_option('wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android


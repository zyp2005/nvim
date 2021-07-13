--======================================================================
--
-- init-basic.vim - 基础配置，该配置需要兼容 vim tiny 模式
--
-- 所有人都能接受的配置，不掺渣任何 keymap, 和偏好设置
--
-- Created by zyp2005 on 2021-07-12 06:48
-- Last Modified: 2021-07-12 06:48
--
--======================================================================
-- vim: vim.o.ts=4 sw=4 tw=78 noet :

------------------------------------------------------------------------
-- 基础设置
------------------------------------------------------------------------

-- 禁用 vi 兼容模式
vim.o.compatible = false

-- 设置 Backspace 键模式
vim.o.backspace = 'eol,start,indent'

-- 自动缩进
vim.o.autoindent = true

-- 打开 C/C++ 语言缩进优化
vim.ocindent = true

-- Windows禁用ALT操作菜单(使得ALT可以用到Vim里)
vim.o.winaltkeys= 'no'

-- 长行不全部显示
vim.o.wrap = false
vim.o.linebreak = true  -- 在breakket的设置下打开回绕
vim.opt.breakat = { ' ', '|', ';', ':', ',', '!', '?' }           -- 回绕默认字符

-- 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
vim.o.ttimeout = true

-- 功能键超时检测 50 毫秒
vim.o.ttimeoutlen = 50

-- 显示光标位置
vim.o.ruler = true

-- 自动切换目录
vim.o.autochdir = true

----------------------------------------------------------------------
-- 搜索设置
----------------------------------------------------------------------

-- 搜索时忽略大小写
vim.o.ignorecase = true

-- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
vim.o.smartcase = true

-- 高亮搜索内容
vim.o.hlsearch = true

-- 查找输入时动态增量显示查找结果
vim.o.incsearch = true

----------------------------------------------------------------------
-- 编码设置
----------------------------------------------------------------------

if vim.fn.has('multi_byte')
then
	-- 内部工作编码
	vim.o.encoding = 'utf-8'

	-- 文件默认编码
	vim.o.fileencoding = 'utf-8'

	-- 打开文件时自动尝试下面顺序的编码
	vim.o.fileencodings = 'ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1'

    -- vim.cmd('scriptencoding utf-8')
end

----------------------------------------------------------------------
-- 允许 Vim 自带脚本根据文件类型自动设置缩进等
----------------------------------------------------------------------
if vim.fn.has('autocmd')
then
	vim.cmd('filetype indent on')
	vim.cmd('filetype plugin on')
	vim.cmd('filetype plugin indent on')
	vim.cmd('filetype plugin indent on')
end

----------------------------------------------------------------------
-- 语法高亮设置
----------------------------------------------------------------------
--[[ if vim.fn.has('syntax')
then
    vim.cmd('syntax enable')
    vim.cmd('syntax on')
end ]]

----------------------------------------------------------------------
-- 其他设置
----------------------------------------------------------------------

-- 为正则表达式打开magic
vim.o.magic = true
-- 显示匹配的括号
vim.o.showmatch = true

-- 显示括号匹配的时间
vim.o.matchtime = 1

-- 添加html括号以配对
vim.o.matchpairs = "(:),{:},[:],<:>"

-- 显示最后一行
vim.o.display = 'lastline'

-- 允许下方显示目录
vim.o.wildmenu = true

-- 延迟绘制（提升性能）
vim.o.lazyredraw = true

-- 错误格式
vim.opt.errorformat = vim.opt.errorformat + '[%f:%l] -> %m,[%f:%l]:%m'

-- 设置分隔符可视
vim.o.listchars = "tab:| ,trail:.,extends:>,precedes:<"

-- 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
-- 或者 Vim 当前目录包含 .tags 文件
vim.o.tags= "./.tags;,.tags"

-- 如遇Unicode值大于255的文本，不必等到空格再折行
vim.opt.formatoptions = vim.opt.formatoptions + "m"

-- 合并两行中文时，不在中间加空格
vim.opt.formatoptions = vim.opt.formatoptions + "B"

-- 文件换行符，默认使用 unix 换行符
vim.o.ffs = "unix,dos,mac"

vim.o.softtabstop = 4

--键码使用不同的超时的值，设置 'ttiomeoutlen' 为非负数。
--vim.o.ttimeoutlen=0
--vim.o.timeout timeoutlen=1000 ttimeoutlen=1000
--vim.o.notimeout

-- 在每行前显示相对于光标所在的行的行号。
vim.o.relativenumber = true

-- 高亮光标所在的文本行
vim.o.cursorline = true

-- 光标上下两侧最少保留的屏幕行数
vim.o.scrolloff = 4

-- 允许鼠标
vim.o.mouse = "a"

-- 保存用于视图和会话的内容:
vim.o.viewoptions = "cursor,folds,slash,unix"

-- 超过78个词换行
vim.o.tw = 78

-- 设置Vim缩短消息长度的标志位列表
vim.opt.shortmess = vim.opt.shortmess + "c"

-- 逗号分隔的选项列表，用于插入模式的补全
vim.o.completeopt = "longest,noinsert,menuone,noselect,preview"

-- session
vim.opt.sessionoptions = vim.opt.sessionoptions + "globals"

-- 应该使滚动更快
vim.o.ttyfast = true

-- 使用可视响铃代替鸣叫
vim.o.visualbell = true
vim.o.errorbells  = true              -- 触发错误提示

-- 显示第100列
vim.o.colorcolumn = "78"


-- 如果未设置“隐藏”，则TextEdit可能会失败。
vim.o.hidden = true

-- 命令行使用的屏幕行数。
vim.o.cmdheight = 1


-- 允许可视列块模式的虚拟编辑。
vim.o.virtualedit = "block"

----------------------------------------------------------------------
-- 文件搜索和补全时忽略下面扩展名
----------------------------------------------------------------------
vim.o.suffixes=".bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class"


vim.opt.wildignorecase = true
vim.opt.wildignore = "*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib"  -- stuff to ignore when tab completing
vim.opt.wildignore = vim.opt.wildignore + "*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex"
vim.opt.wildignore = vim.opt.wildignore + "*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz"    -- MacOSX/Linux
vim.opt.wildignore = vim.opt.wildignore + "*DS_Store*,*.ipch"
vim.opt.wildignore = vim.opt.wildignore + "*.gem"
vim.opt.wildignore = vim.opt.wildignore + "*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso"
vim.opt.wildignore = vim.opt.wildignore + "*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**"
vim.opt.wildignore = vim.opt.wildignore + "*/.nx/**,*.app,*.git,.git"
vim.opt.wildignore = vim.opt.wildignore + "*.wav,*.mp3,*.ogg,*.pcm"
vim.opt.wildignore = vim.opt.wildignore + "*.mht,*.suo,*.sdf,*.jnlp"
vim.opt.wildignore = vim.opt.wildignore + "*.chm,*.epub,*.pdf,*.mobi,*.ttf"
vim.opt.wildignore = vim.opt.wildignore + "*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc"
vim.opt.wildignore = vim.opt.wildignore + "*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps"
vim.opt.wildignore = vim.opt.wildignore + "*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu"
vim.opt.wildignore = vim.opt.wildignore + "*.gba,*.sfc,*.078,*.nds,*.smd,*.smc"
vim.opt.wildignore = vim.opt.wildignore + "*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android"


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
-- vim: set ts=4 sw=4 tw=78 noet :

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

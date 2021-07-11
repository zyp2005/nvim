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
vim.o.nocompatible = true

-- 设置 Backspace 键模式
vim.o.backspace = { 'eol', 'start', 'indent' }

-- 自动缩进
vim.o.autoindent = true

-- 打开 C/C++ 语言缩进优化
vim.ocindent = true

-- Windows禁用ALT操作菜单(使得ALT可以用到Vim里)

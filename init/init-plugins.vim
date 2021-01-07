"======================================================================
"
" init-plugins.vim -
"
" Created by zyp2005 on 2020/12/26
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :



"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = ['basic','enhanced', 'filetypes', 'textobj']
	let g:bundle_group += [ 'airline',  'echodoc','fzf']
	let g:bundle_group += ['Leaderf','extra','coc','debug','vimtex']
	let g:bundle_group += ['calender','editor','general_writing','asyncrun']
	let g:bundle_group += ['vista']
endif


"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.config/nvim/bundles'))
Plug 'https://github.com/neovim/nvim-lspconfig.git'
Plug 'https://github.com/nvim-lua/completion-nvim.git'
"----------------------------------------------------------------------
" 默认插件
"----------------------------------------------------------------------

if index(g:bundle_group, 'quickui') >= 0
	Plug 'https://github.com/skywind3000/vim-quickui.git'
endif

if index(g:bundle_group, 'fzf') >= 0
	Plug 'https://hub.fastgit.org/junegunn/fzf', { 'build': { -> fzf#install() } }
	Plug 'https://hub.fastgit.org/junegunn/fzf.vim'
	" Plug 'https://hub.fastgit.org/antoinemadec/coc-fzf'

endif

if index(g:bundle_group, 'calendar') >= 0

	Plug 'https://hub.fastgit.org/itchyny/calendar.vim'

endif

if index(g:bundle_group, 'asyncrun') >= 0

	Plug 'https://hub.fastgit.org/skywind3000/asynctasks.vim'
	Plug 'https://hub.fastgit.org/skywind3000/asyncrun.vim'

endif

if index(g:bundle_group, 'general_writing') >= 0
	Plug 'https://hub.fastgit.org/junegunn/goyo.vim'
	Plug 'https://hub.fastgit.org/reedes/vim-wordy'
	Plug 'https://hub.fastgit.org/ron89/thesaurus_query.vim'
endif


if index(g:bundle_group, 'editor') >= 0

	Plug 'https://hub.fastgit.org/jiangmiao/auto-pairs'
	Plug 'https://hub.fastgit.org/mg979/vim-visual-multi'
	Plug 'https://hub.fastgit.org/tomtom/tcomment_vim' " 在<space> cn中注释行
	Plug 'https://hub.fastgit.org/jwarby/antovim.git' " gs切换
	Plug 'https://hub.fastgit.org/tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
	Plug 'https://hub.fastgit.org/gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type k) k] k} kp
	Plug 'https://hub.fastgit.org/junegunn/vim-after-object' " da= to delete what's after =
	" Plug 'https://hub.fastgit.org/tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
	"Plug 'https://hub.fastgit.org/Konfekt/FastFold')
	"Plug 'https://hub.fastgit.org/junegunn/vim-peekaboo')
	" Plug 'https://hub.fastgit.org/wellle/context.vim'
	"Plug 'https://hub.fastgit.org/svermeulen/vim-subversive')
	" Plug 'https://hub.fastgit.org/theniceboy/argtextobj.vim'
	Plug 'https://hub.fastgit.org/rhysd/clever-f.vim'
	Plug 'https://hub.fastgit.org/chrisbra/NrrwRgn'
	" Find & Replace
	Plug 'https://hub.fastgit.org/brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
	" Plug 'https://hub.fastgit.org/AndrewRadev/splitjoin.vim'

endif

if index(g:bundle_group, 'vimtex') >= 0

	Plug 'https://hub.fastgit.org/lervag/vimtex'


endif



if index(g:bundle_group, 'debug') >= 0

	Plug 'https://hub.fastgit.org/puremourning/vimspector'
	Plug 'Shougo/vimproc.vim', {'do' : 'make'}
	Plug 'https://hub.fastgit.org/idanarye/vim-vebugger'


endif



"----------------------------------------------------------------------
"   础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

	"   文快速移动，<space><leader>f{char}   可触发
	Plug 'https://hub.fastgit.org/easymotion/vim-easymotion',{'on':['<Plug>(easymotion-overwin-f','<Plug>(easymotion-overwin-f2)','<Plug>(easymotion-overwin-line)','<Plug>(easymotion-overwin-w)']}
	"   示开始画面
	Plug 'https://hub.fastgit.org/hardcoreplayers/dashboard-nvim.git'

	"  动终端
	Plug 'https://hub.fastgit.org/voldikss/vim-floaterm',{'on':'FloatermNew'}


	Plug 'https://hub.fastgit.org/lambdalisue/suda.vim' " do stuff like :sudowrite

	"  colorscheme
	Plug 'https://hub.fastgit.org/sainnhe/gruvbox-material'
	Plug 'https://hub.fastgit.org/rakr/vim-one'

	"   持库，  其他插件用的函数库
	Plug 'https://hub.fastgit.org/xolox/vim-misc.git'

	"   用 ALT+e   在不同窗口/  签上显示 A/B/C   编号，  后字母直接跳转
	Plug 't9md/vim-choosewin'

	"   供基于 TAGS   定义预览，  数参数预览，quickfix   览
	Plug 'https://hub.fastgit.org/skywind3000/vim-preview',{'on':'PreviewQuickfix'}

	" Git   持
	Plug 'https://hub.fastgit.org/tpope/vim-fugitive'

	"   段
	Plug 'https://hub.fastgit.org/honza/vim-snippets'

endif


"----------------------------------------------------------------------
"   强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

	" 表格对齐，使用命令 Tabularize
	Plug 'https://hub.fastgit.org/godlygeek/tabular', { 'on': 'Tabularize' }

	" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
	Plug 'https://hub.fastgit.org/chrisbra/vim-diff-enhanced'

	" Autoformat
	Plug 'https://hub.fastgit.org/Chiel92/vim-autoformat',{'on':'Autoformat'}

	" Undo Tree
	Plug 'https://hub.fastgit.org/mbbill/undotree'

	"彩虹括号
	Plug 'https://hub.fastgit.org/luochen1990/rainbow'

	"中文文档
	Plug 'https://hub.fastgit.org/yianwillis/vimcdoc'

	"空白检测
	Plug 'https://hub.fastgit.org/ntpeters/vim-better-whitespace.git'

	"提供图形字符支持
	Plug 'https://hub.fastgit.org/ryanoasis/vim-devicons'

	"翻译
	Plug 'https://hub.fastgit.org/voldikss/vim-translator',{'on':['<Plug>(coc-translator-e)','<Plug>TranslateV','<Plug>(coc-translator-p)','<Plug>TranslateWV','<Plug>TranslateR','<Plug>TranslateRV']}

	" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
	Plug 'terryma/vim-expand-region'


endif





"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------


if index(g:bundle_group, 'vista') >= 0
	Plug 'https://hub.fastgit.org/liuchengxu/vista.vim'
endif

if index(g:bundle_group, 'tags') >= 0
	" 提供 ctags/gtags 后台数据库自动更新功能
	Plug 'https://hub.fastgit.org/ludovicchabant/vim-gutentags'

	" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
	" 支持光标移动到符号名上：<space>cg 查看定义，<leader>cs 查看引用
	Plug 'https://hub.fastgit.org/skywind3000/gutentags_plus'

endif


"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0

	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'https://hub.fastgit.org/kana/vim-textobj-user'

	" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
	Plug 'https://hub.fastgit.org/kana/vim-textobj-indent'

	" 语法文本对象：iy/ay 基于语法的文本对象
	Plug 'https://hub.fastgit.org/kana/vim-textobj-syntax'

	" 函数文本对象：if/af 支持 c/c++/vim/java
	Plug 'https://hub.fastgit.org/kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

	" 参数文本对象：i,/a, 包括参数或者列表元素
	Plug 'https://hub.fastgit.org/sgur/vim-textobj-parameter'

	" 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
	Plug 'https://hub.fastgit.org/bps/vim-textobj-python', {'for': 'python'}

	" 提供 uri/url 的文本对象，iu/au 表示
	Plug 'https://hub.fastgit.org/jceb/vim-textobj-uri'
endif


"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0

	" powershell 脚本文件的语法高亮
	Plug 'https://hub.fastgit.org/pprovost/vim-ps1', { 'for': 'ps1' }

	" lua 语法高亮增强
	Plug 'https://hub.fastgit.org/tbastos/vim-lua', { 'for': 'lua' }

	" C++ 语法高亮增强，支持 11/14/17 标准
	" Plug 'https://hub.fastgit.org/octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

	" 额外语法文件
	Plug 'https://hub.fastgit.org/justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

	" python 语法文件增强
	Plug 'https://hub.fastgit.org/vim-python/python-syntax', { 'for': ['python'] }

	" rust 语法增强
	Plug 'https://hub.fastgit.org/rust-lang/rust.vim', { 'for': 'rust' }

	" vim org-mode
	Plug 'https://hub.fastgit.org/jceb/vim-orgmode', { 'for': 'org' }

	"c/c++语言高亮
	Plug 'https://hub.fastgit.org/jackguo380/vim-lsp-cxx-highlight.git', { 'for': ['c', 'cpp'] }

	"高亮变量名
	Plug 'https://hub.fastgit.org/jaxbot/semantic-highlight.vim.git'

	" Markdown
	Plug 'https://hub.fastgit.org/iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' , 'for' :['markdown', 'vim-plug'] }
	Plug 'https://hub.fastgit.org/dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
	Plug 'https://hub.fastgit.org/mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
	Plug 'https://hub.fastgit.org/dkarter/bullets.vim',{ 'for': ['markdown', 'vim-plug'] }
endif


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
	Plug 'https://hub.fastgit.org/vim-airline/vim-airline'
	Plug 'https://hub.fastgit.org/vim-airline/vim-airline-themes'
	Plug 'https://hub.fastgit.org/zefei/vim-wintabs'
	Plug 'https://hub.fastgit.org/zefei/vim-wintabs-powerline'

endif


"----------------------------------------------------------------------
" LanguageTool 语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'grammer') >= 0
	Plug 'https://hub.fastgit.org/rhysd/vim-grammarous'
endif


"----------------------------------------------------------------------
" ale：动态语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'ale') >= 0
	Plug 'https://hub.fastgit.org/w0rp/ale'
endif


"----------------------------------------------------------------------
" echodoc：搭配 YCM/deoplete 在底部显示函数参数
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
	Plug 'https://hub.fastgit.org/Shougo/echodoc.vim.git'
endif


"----------------------------------------------------------------------
" leaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'Leaderf') >= 0
	" 如果 vim 支持 python 则启用  Leaderf
	Plug 'https://hub.fastgit.org/Yggdroot/leaderF', { 'do': './install.sh' }
endif

"----------------------------------------------------------------------
" coc.nvim : lsp客户端
"----------------------------------------------------------------------
if index(g:bundle_group, 'coc') >= 0
	Plug 'https://hub.fastgit.org/neoclide/coc.nvim', {'branch': 'release'} "ss

endif



"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()


"##### auto fcitx  ###########
let g:input_toggle = 2
function! Fcitx2en()
	let s:input_status = system("fcitx5-remote")
	if s:input_status == 2
		let g:input_toggle = 1
		let l:a = system("fcitx5-remote -c")
	endif
endfunction

function! Fcitx2zh()
	let s:input_status = system("fcitx5-remote")
	if s:input_status != 2 && g:input_toggle == 1
		let l:a = system("fcitx5-remote -o")
		let g:input_toggle = 0
	endif
endfunction


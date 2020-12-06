"======================================================================
"
" init-plugins.vim - 
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :



"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = ['basic', 'tags', 'enhanced', 'filetypes', 'textobj']
	let g:bundle_group += ['tags', 'airline',  'echodoc']
	let g:bundle_group += ['leaderf',"extra"]
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


"----------------------------------------------------------------------
" 默认插件 
"----------------------------------------------------------------------

" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'https://hub.fastgit.org/easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
" map ' <Plug>(easymotion-overwin-f2)
" nmap ' <Plug>(easymotion-overwin-f2)
"map E <Plug>(easymotion-j)
"map U <Plug>(easymotion-k)
"nmap f <Plug>(easymotion-overwin-f)
"map \; <Plug>(easymotion-prefix)
"nmap ' <Plug>(easymotion-overwin-f2)
"map 'l <Plug>(easymotion-bd-jk)
"nmap 'l <Plug>(easymotion-overwin-line)
"map  'w <Plug>(easymotion-bd-w)
"nmap 'w <Plug>(easymotion-overwin-w)
nmap <space>ef <Plug>(easymotion-overwin-f)
nmap <space>eF <Plug>(easymotion-overwin-f2)
nmap <space>el <Plug>(easymotion-overwin-line)
nmap <space>ew <Plug>(easymotion-overwin-w)

" 表格对齐，使用命令 Tabularize
Plug 'https://hub.fastgit.org/godlygeek/tabular', { 'on': 'Tabularize' }
vmap <space>d :Tabularize /
nmap <space>d :Tabularize /

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'https://hub.fastgit.org/chrisbra/vim-diff-enhanced'
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

	" 展示开始画面，显示最近编辑过的文件

	"  colorscheme
	Plug 'https://hub.fastgit.org/sainnhe/gruvbox-material'
	Plug 'https://hub.fastgit.org/rakr/vim-one'
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	set t_Co=256
	set termguicolors
	set background=dark
	"let g:gruvbox_material_background = 'soft' "hard
	let g:gruvbox_material_diagnostic_line_highlight = 1
	"let g:gruvbox_material_current_word = 'bold'
	let g:gruvbox_material_palette = 'mix'
	let g:gruvbox_material_background = 'medium'
	let g:gruvbox_material_enable_italic = 1
	let g:gruvbox_material_better_performance = 1
	"let g:gruvbox_material_transparent_background = 1
	"let g:gruvbox_material_disable_italic_comment = 1
	let g:gruvbox_material_enable_bold = 1
	let g:airline_theme='gruvbox_material'


	" 支持库，给其他插件用的函数库
	Plug 'xolox/vim-misc'

	" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）

	" 用于在侧边符号栏显示 git/svn 的 diff

	" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
	" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
	Plug 'mh21/errormarker.vim'

	" 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
	Plug 't9md/vim-choosewin'

	" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
	Plug 'skywind3000/vim-preview'

	" Git 支持
	Plug 'tpope/vim-fugitive'

	" 使用 ALT+E 来选择窗口
	nmap <m-e> <Plug>(choosewin)

	" 使用 <space>ha 清除 errormarker 标注的错误
	noremap <silent><space>ha :RemoveErrorMarkers<cr>

endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

	"彩虹括号
	Plug 'https://hub.fastgit.org/luochen1990/rainbow'
	let g:rainbow_active = 1

	"中文文档
	Plug 'https://hub.fastgit.org/yianwillis/vimcdoc'

	"空白检测
	Plug 'https://hub.fastgit.org/bronson/vim-trailing-whitespace'

	"提供图形字符支持
	Plug 'https://hub.fastgit.org/ryanoasis/vim-devicons'

	"翻译
	Plug 'https://hub.fastgit.org/voldikss/vim-translator'
	""vnoremap <silent> <C-t> :<C-u>Ydv<CR>
	""nnoremap <silent> <C-t> :<C-u>Ydc<CR>
	""noremap <silent> <Leader>yd :<C-u>Yde<CR>
	"" <Leader>t 翻译光标下的文本，在命令行回显
	nmap <silent> <Leader>ty <Plug>(coc-translator-e)
	vmap <silent> <Leader>ty <Plug>TranslateV
	" Leader>w 翻译光标下的文本，在窗口中显示
	nmap <silent> <Leader>tw <Plug>(coc-translator-p)
	vmap <silent> <Leader>tw <Plug>TranslateWV
	" Leader>r 替换光标下的文本为翻译内容
	nmap <silent> <Leader>tr <Plug>TranslateR
	vmap <silent> <Leader>tr <Plug>TranslateRV
	let g:translator_window_max_width = 0.5

	" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
	Plug 'terryma/vim-expand-region'

	" 快速文件搜索
	Plug 'https://hub.fastgit.org/junegunn/fzf', { 'build': { -> fzf#install() } }
	Plug 'https://hub.fastgit.org/junegunn/fzf.vim'
	let g:fzf_preview_window = 'right:50%'
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
	let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7 } }
	" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
	Plug 'asins/vim-dict'

	" 使用 :FlyGrep 命令进行实时 grep
	Plug 'wsdjeg/FlyGrep.vim'

	" 使用 :CtrlSF 命令进行模仿 sublime 的 grep
	Plug 'dyng/ctrlsf.vim'

	" 配对括号和引号自动补全

	" 提供 gist 接口
	Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
	
	" ALT_+/- 用于按分隔符扩大缩小 v 选区
	map <m-=> <Plug>(expand_region_expand)
	map <m--> <Plug>(expand_region_shrink)
endif





"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

	" 提供 ctags/gtags 后台数据库自动更新功能
	Plug 'ludovicchabant/vim-gutentags'

	" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
	" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
	Plug 'skywind3000/gutentags_plus'

	" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
	let g:gutentags_project_root = ['.root']
	let g:gutentags_ctags_tagfile = '.tags'

	" 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
	let g:gutentags_cache_dir = expand('~/.cache/tags')

	" 默认禁用自动生成
	let g:gutentags_modules = [] 

	" 如果有 ctags 可执行就允许动态生成 ctags 文件
	if executable('ctags')
		let g:gutentags_modules += ['ctags']
	endif

	" 如果有 gtags 可执行就允许动态生成 gtags 数据库
	if executable('gtags') && executable('gtags-cscope')
		let g:gutentags_modules += ['gtags_cscope']
	endif

	" 设置 ctags 的参数
	let g:gutentags_ctags_extra_args = []
	let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

	" 使用 universal-ctags 的话需要下面这行，请反注释
	" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

	" 禁止 gutentags 自动链接 gtags 数据库
	let g:gutentags_auto_add_gtags_cscope = 0
endif


"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0

	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'

	" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
	Plug 'kana/vim-textobj-indent'

	" 语法文本对象：iy/ay 基于语法的文本对象
	Plug 'kana/vim-textobj-syntax'

	" 函数文本对象：if/af 支持 c/c++/vim/java
	Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

	" 参数文本对象：i,/a, 包括参数或者列表元素
	Plug 'sgur/vim-textobj-parameter'

	" 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
	Plug 'bps/vim-textobj-python', {'for': 'python'}

	" 提供 uri/url 的文本对象，iu/au 表示
	Plug 'jceb/vim-textobj-uri'
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
	" Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

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




endif


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
	Plug 'https://hub.fastgit.org/vim-airline/vim-airline'
	Plug 'https://hub.fastgit.org/vim-airline/vim-airline-themes'
	Plug 'https://hub.fastgit.org/zefei/vim-wintabs'
	Plug 'https://hub.fastgit.org/zefei/vim-wintabs-powerline'

	let g:airline_theme='gruvbox_material'
	let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
	let g:airline_section_b = '%{get(g:,"coc_git_status","")}%{get(b:,"coc_git_status","")}%{get(b:,"coc_git_blame","")}'
	let g:airline_section_a = airline#section#create_left(['mode','%{strftime("%m/%d-%H:%M")}', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
	let g:airline_section_c = airline#section#create(['%<', 'file','readonly'])
	let airline#extensions#coc#error_symbol = 'E:'
	let airline#extensions#coc#warning_symbol = 'W:'
	let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
	let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

	let g:wintabs_ui_buffer_name_format = '%o:%t'
	nmap <M-[> <Plug>(wintabs_previous)
	nmap <M-]> <Plug>(wintabs_next)
	nmap <space>wc <Plug>(wintabs_close)
	nmap <space>wu <Plug>(wintabs_undo)
	nmap <space>wo <Plug>(wintabs_only)
	nmap <space>wwc <Plug>(wintabs_close_window)
	nmap <space>wwo <Plug>(wintabs_only_window)
	nmap <space>g1 :WintabsGo 1<cr>
	nmap <space>g2 :WintabsGo 2<cr>
	nmap <space>g3 :WintabsGo 3<cr>
	nmap <space>g4 :WintabsGo 4<cr>
	nmap <space>g5 :WintabsGo 5<cr>
	nmap <space>g6 :WintabsGo 6<cr>
	nmap <space>g7 :WintabsGo 7<cr>
	nmap <space>g8 :WintabsGo 8<cr>
	nmap <space>g9 :WintabsGo 9<cr>
	nmap <space>wm :WintabsMove
endif


"----------------------------------------------------------------------
" LanguageTool 语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'grammer') >= 0
	Plug 'rhysd/vim-grammarous'
	noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
	map <space>rr <Plug>(grammarous-open-info-window)
	map <space>rv <Plug>(grammarous-move-to-info-window)
	map <space>rs <Plug>(grammarous-reset)
	map <space>rx <Plug>(grammarous-close-info-window)
	map <space>rm <Plug>(grammarous-remove-error)
	map <space>rd <Plug>(grammarous-disable-rule)
	map <space>rn <Plug>(grammarous-move-to-next-error)
	map <space>rp <Plug>(grammarous-move-to-previous-error)
endif


"----------------------------------------------------------------------
" ale：动态语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'ale') >= 0
	Plug 'w0rp/ale'

	" 设定延迟和提示信息
	let g:ale_completion_delay = 500
	let g:ale_echo_delay = 20
	let g:ale_lint_delay = 500
	let g:ale_echo_msg_format = '[%linter%] %code: %%s'

	" 设定检测的时机：normal 模式文字改变，或者离开 insert模式
	" 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
	let g:ale_lint_on_text_changed = 'normal'
	let g:ale_lint_on_insert_leave = 1

	" 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
	if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
		let g:ale_command_wrapper = 'nice -n5'
	endif

	" 允许 airline 集成
	let g:airline#extensions#ale#enabled = 1

	" 编辑不同文件类型需要的语法检查器
	let g:ale_linters = {
				\ 'c': ['gcc', 'cppcheck'], 
				\ 'cpp': ['gcc', 'cppcheck'], 
				\ 'python': ['flake8', 'pylint'], 
				\ 'lua': ['luac'], 
				\ 'go': ['go build', 'gofmt'],
				\ 'java': ['javac'],
				\ 'javascript': ['eslint'], 
				\ }


	" 获取 pylint, flake8 的配置文件，在 vim-init/tools/conf 下面
	function s:lintcfg(name)
		let conf = s:path('tools/conf/')
		let path1 = conf . a:name
		let path2 = expand('~/.vim/linter/'. a:name)
		if filereadable(path2)
			return path2
		endif
		return shellescape(filereadable(path2)? path2 : path1)
	endfunc

	" 设置 flake8/pylint 的参数
	let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
	let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
	let g:ale_python_pylint_options .= ' --disable=W'
	let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
	let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
	let g:ale_c_cppcheck_options = ''
	let g:ale_cpp_cppcheck_options = ''

	let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

	" 如果没有 gcc 只有 clang 时（FreeBSD）
	if executable('gcc') == 0 && executable('clang')
		let g:ale_linters.c += ['clang']
		let g:ale_linters.cpp += ['clang']
	endif
endif


"----------------------------------------------------------------------
" echodoc：搭配 YCM/deoplete 在底部显示函数参数
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
	Plug 'Shougo/echodoc.vim'
	set noshowmode
	let g:echodoc#enable_at_startup = 1
endif


"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'leaderf') >= 0
	" 如果 vim 支持 python 则启用  Leaderf
	if has('python') || has('python3')
		Plug 'Yggdroot/LeaderF'

		" CTRL+p 打开文件模糊匹配
		let g:Lf_ShortcutF = '<c-p>'

		" ALT+n 打开 buffer 模糊匹配
		let g:Lf_ShortcutB = '<m-n>'

		" CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
		noremap <c-n> :LeaderfMru<cr>

		" ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
		noremap <m-p> :LeaderfFunction!<cr>

		" ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
		noremap <m-P> :LeaderfBufTag!<cr>

		" ALT+n 打开 buffer 列表进行模糊匹配
		noremap <m-n> :LeaderfBuffer<cr>

		" ALT+m 全局 tags 模糊匹配
		noremap <m-m> :LeaderfTag<cr>

		" 最大历史文件保存 2048 个
		let g:Lf_MruMaxFiles = 2048

		" ui 定制
		let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

		" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
		let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
		let g:Lf_WorkingDirectoryMode = 'Ac'
		let g:Lf_WindowHeight = 0.30
		let g:Lf_CacheDirectory = expand('~/.vim/cache')

		" 显示绝对路径
		let g:Lf_ShowRelativePath = 0

		" 隐藏帮助
		let g:Lf_HideHelp = 1

		" 模糊匹配忽略扩展名
		let g:Lf_WildIgnore = {
					\ 'dir': ['.svn','.git','.hg'],
					\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
					\ }

		" MRU 文件忽略扩展名
		let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
		let g:Lf_StlColorscheme = 'powerline'

		" 禁用 function/buftag 的预览功能，可以手动用 p 预览
		let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

		" 使用 ESC 键可以直接退出 leaderf 的 normal 模式
		let g:Lf_NormalMap = {
				\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
				\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
				\ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
				\ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
				\ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
				\ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
				\ }

	else
		" 不支持 python ，使用 CtrlP 代替
		Plug 'ctrlpvim/ctrlp.vim'

		" 显示函数列表的扩展插件
		Plug 'tacahiroy/ctrlp-funky'

		" 忽略默认键位
		let g:ctrlp_map = ''

		" 模糊匹配忽略
		let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
		  \ 'link': 'some_bad_symbolic_links',
		  \ }

		" 项目标志
		let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
		let g:ctrlp_working_path = 0

		" CTRL+p 打开文件模糊匹配
		noremap <c-p> :CtrlP<cr>

		" CTRL+n 打开最近访问过的文件的匹配
		noremap <c-n> :CtrlPMRUFiles<cr>

		" ALT+p 显示当前文件的函数列表
		noremap <m-p> :CtrlPFunky<cr>

		" ALT+n 匹配 buffer
		noremap <m-n> :CtrlPBuffer<cr>
	endif
endif


"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()



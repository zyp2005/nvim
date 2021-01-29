
"General settins{{{
set mouse=nv                 " 在命令行模式下禁用鼠标
set report=0                 " 不要报告在线更改
set errorbells               " 触发错误提示
set visualbell               " 用视觉铃声代替蜂鸣声
set hidden                   " 放弃而不是卸载时隐藏缓冲区
set fileformats=unix,dos,mac " 使用unix作为标准文件类型
set magic                    " 为正则表达式打开magic
set path+=**                 " 使用gf和朋友时要搜索的目录
set isfname-==               " Remove =, detects filename in var=/foo/bar
set virtualedit=block        "允许可视列块模式的虚拟编辑
set synmaxcol=2500           " 不要用语法突出显示长行
set formatoptions+=1         " 一个字母的单词后不要换行
set formatoptions-=t         " 不要自动换行
set formatoptions-=o         " 禁用评论继续 (normal 'o'/'O')
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif

" 保存用于视图和会话的内容:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize

if has('mac')
	let g:clipboard = {
		\   'name': 'macOS-clipboard',
		\   'copy': {
		\      '+': 'pbcopy',
		\      '*': 'pbcopy',
		\    },
		\   'paste': {
		\      '+': 'pbpaste',
		\      '*': 'pbpaste',
		\   },
		\   'cache_enabled': 0,
		\ }
endif

if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

" wildmenu {{{
" --------
if has('wildmenu')
	if ! has('nvim')
		set wildmode=list:full
	endif

	" if has('nvim')
	" 	set wildoptions=pum
	" else
	" 	set nowildmenu
	" 	set wildmode=list:longest,full
	" 	set wildoptions=tagfile
	" endif
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
	set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif
" }}}

" vim目录 {{{
" ---------------
set nobackup
set nowritebackup
set undofile noswapfile
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
" 使用coc-spell-checker执行此操作
" set spellfile=$VIM_PATH/spell/en.utf-8.add

" 历史保存
set history=2000

if has('nvim') && ! has('win32') && ! has('win64')
	set shada=!,'300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

augroup user_persistent_undo
	autocmd!
	au BufWritePre /tmp/*          setlocal noundofile
	au BufWritePre COMMIT_EDITMSG  setlocal noundofile
	au BufWritePre MERGE_MSG       setlocal noundofile
	au BufWritePre *.tmp           setlocal noundofile
	au BufWritePre *.bak           setlocal noundofile
augroup END

" 如果是sudo，请禁用vim swap / backup / undo / shada / viminfo编写
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
		\ && $HOME !=# expand('~'.$USER)
		\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set noundofile
	if has('nvim')
		set shada="NONE"
	else
		set viminfo="NONE"
	endif
endif

" 保护敏感信息，禁用临时目录中的备份文件
if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
	set backupskip+=.vault.vim
endif

" 禁用临时目录或shm中的swap / undo / viminfo / shada文件
augroup user_secure
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

" }}}

" 制表符和缩进 {{{
" ----------------
set textwidth=80    " 换行前文字宽度最大字符
set noexpandtab     " 不要将制表符扩展到空格
set tabstop=4       " 制表符的空格数
set shiftwidth=4    " 缩进宽度
set softtabstop=-1  " 自动与shiftwidth保持同步
set smarttab        " tab根据'shiftwidth'插入空白
set autoindent      " 在新行上使用相同的缩进
set smartindent     " 在新行上智能自动缩进
set shiftround      " 将缩进舍入为“ shiftwidth”的倍数

if exists('&breakindent')
	set breakindentopt=shift:4,min:20
endif

" }}}

" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=500   " 映射超时
set ttimeoutlen=10   " 按键密码超时
set updatetime=100   " 空闲时间来写交换并触发游标保持
set redrawtime=1500  " 停止显示重绘的时间（以毫秒为单位）

" }}}

" 搜索 {{{
" ---------
set ignorecase    " 搜索忽略大小写
set smartcase     " *时请注意大小写
set infercase     " 在插入完成模式下调整大小写
set incsearch     " 增量搜索
set wrapscan      " 搜索环绕文件末尾
set hlsearch      " 突出显示搜索结果

set complete=.,w,b,k  " c-n完成：扫描缓冲区，窗口和字典

if exists('+inccommand')
	set inccommand=nosplit
endif

if executable('rg')
	set grepformat=%f:%l:%m
	let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
elseif executable('ag')
	set grepformat=%f:%l:%m
	let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif

" }}}

" 行为 {{{
" --------
set autoread                    " 自动读取文件
set nowrap                      " 默认长行不回绕
set linebreak                   " 在breakket的设置下打开回绕
set breakat=\ \	;:,!?           " 回绕默认字符
set nostartofline               " 光标定位在同一列中的几个命令
set whichwrap+=h,l,<,>,[,],~    " 移至某些键的下一行
set splitbelow splitright       " 右下分割
set switchbuf=useopen,vsplit    " 跳到第一个打开的窗口
set backspace=indent,eol,start  " 插入模式下直观的退格
set diffopt=filler,iwhite       " 差异模式：显示填充符，忽略空格
set completeopt=menu,menuone    " 总是显示菜单，即使是一个
set completeopt+=noselect,noinsert

if exists('+completepopup')
	set completeopt+=popup
	set completepopup=height:4,width:60,highlight:InfoPopup
endif

" Use the new Neovim :h jumplist-stack
if has('nvim-0.5')
	set jumpoptions=stack
endif

if has('patch-8.1.0360') || has('nvim-0.4')
	set diffopt+=internal,algorithm:patience
	" set diffopt=indent-heuristic,algorithm:patience
endif
" }}}


" 编辑器ui {{{
set termguicolors       " 启用真彩色
set number              " 显示行号
set relativenumber      " 显示相对编号
set noshowmode          " 不要在底部显示模式
set noruler             " 禁用默认状态标尺
set shortmess=aFc
set scrolloff=4         " Keep at least 2 lines above/below
" set fillchars+=vert:\|  " 添加垂直分割条
set fcs=eob:\           " hide ~ tila
set list
set listchars=tab:\|\ ,nbsp:+,trail:·,extends:→,precedes:←  " 设置分隔符可视
set title
" Title length.
set titlelen=95
" Title string.
let &g:titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"

set showmatch           " 跳转到匹配的括号
set matchpairs+=<:>     " 添加html括号以配对
set matchtime=1         " 十分之一秒显示匹配的括号

set showtabline=2       " 总是显示状态栏
set winwidth=30         " 活动窗口的最小宽度
set winminwidth=10      " 非活动窗口的最小宽度
" set winheight=4         " Minimum height for active window
set winminheight=1      " 非活动窗口的最小高度
set pumheight=15        " 弹出菜单的行高
set helpheight=12       " 最小帮助窗口高度
set previewheight=12    " 完成预览高度


set showcmd             " 在状态行中显示命令
set cmdheight=1         " 命令行高度
set cmdwinheight=7      " 命令行
set noequalalways       " 不在拆分或关闭时调整窗口大小
set laststatus=2        " 始终显示状态行
"set colorcolumn=+0      " 文字高亮显示在textwidth的最大字符数限制处
set display=lastline

if has('folding') && has('vim_starting')
	set foldenable
	set foldmethod=indent
	set foldlevelstart=99
	set indentexpr=
endif

if has('nvim-0.4')
	set signcolumn=yes:1
else
	set signcolumn=yes           " Always show signs column
endif

if has('conceal') && v:version >= 703
	" For snippet_complete marker
	set conceallevel=2 concealcursor=niv
endif

if exists('+previewpopup')
	set previewpopup=height:10,width:60
endif

" 完成菜单和浮动窗口的伪透明性
if &termguicolors
	if exists('&pumblend')
		set pumblend=10
	endif
	if exists('&winblend')
		set winblend=10
	endif
endif

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

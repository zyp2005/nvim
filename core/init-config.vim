"======================================================================
"
" init-config.vim - 正常模式下的配置，在 init-basic.vim 后调用
"
" Created by zyp00 on 2020/12/26
" Last Modified: 2018/05/30 19:20:46
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 有 tmux 何没有的功能键超时（毫秒）
"----------------------------------------------------------------------
if $TMUX != ''
	set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
	set ttimeoutlen=80
endif


"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
if has('nvim') == 0 && has('gui_running') == 0
	function! s:metacode(key)
		exec "set <M-".a:key.">=\e".a:key
	endfunc
	for i in range(10)
		call s:metacode(nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(nr2char(char2nr('a') + i))
		call s:metacode(nr2char(char2nr('A') + i))
	endfor
	for c in [',', '.', '/', ';', '{', '}']
		call s:metacode(c)
	endfor
	for c in ['?', ':', '-', '_', '+', '=', "'"]
		call s:metacode(c)
	endfor
endif


"----------------------------------------------------------------------
" 终端下功能键设置
"----------------------------------------------------------------------
function! s:key_escape(name, code)
	if has('nvim') == 0 && has('gui_running') == 0
		exec "set ".a:name."=\e".a:code
	endif
endfunc


"----------------------------------------------------------------------
" 功能键终端码矫正
"----------------------------------------------------------------------
call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')


"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

"================================================================
"日志文件
"================================================================
" 将数据/缓存目录设置为 $XDG_CACHE_HOME/vim
let $DATA_PATH =
	\ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/nvim')
if has('vim_starting')
	" 确保数据目录
	for s:path in [
			\ $DATA_PATH,
			\ $DATA_PATH . '/undo',
			\ $DATA_PATH . '/backup',
			\ $DATA_PATH . '/session']
		if ! isdirectory(s:path)
			call mkdir(s:path, 'p')
		endif
	endfor
endif


"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

" 允许备份
set backup

" 保存时备份
" set writebackup

" 如果过了这么多毫秒数以后还没有任何输入，把交换文件写入磁盘
set updatetime=100


" 备份文件地址，统一管理
set backupdir=~/.cache/nvim/backup

" 备份文件扩展名
set backupext=.bak

" 禁用交换文件
set noswapfile

" 启用 undo文件
if has('persistent_undo')
	set undofile
	set undodir=~/.cache/nvim/undo,.
endif

if has('nvim') && ! has('win32') && ! has('win64')
	set shada=!,'300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

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



"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------

" 修正 ScureCRT/XShell 以及某些终端乱码问题，主要原因是不支持一些
" 终端控制命令，比如 cursor shaping 这类更改光标形状的 xterm 终端命令
" 会令一些支持 xterm 不完全的终端解析错误，显示为错误的字符，比如 q 字符
" 如果你确认你的终端支持，不会在一些不兼容的终端上运行该配置，可以注释
if has('nvim')

elseif (!has('gui_running')) && has('terminal') && has('patch-8.0.1200')
	let g:termcap_guicursor = &guicursor
	let g:termcap_t_RS = &t_RS
	let g:termcap_t_SH = &t_SH
	set guicursor=
	set t_RS=
	set t_SH=
endif

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif



"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
augroup InitFileTypesGroup

	" 清除同组的历史 autocommand
	au!

	" C/C++ 文件使用 // 作为注释
	au FileType c,cpp setlocal commentstring=//\ %s

	" markdown 允许自动换行
	au FileType markdown setlocal wrap

	" lisp 进行微调
	au FileType lisp setlocal ts=8 sts=2 sw=2 et

	" scala 微调
	au FileType scala setlocal sts=4 sw=4 noet

	" haskell 进行微调
	au FileType haskell setlocal et

	" quickfix 隐藏行号
	au FileType qf setlocal nonumber

	" 强制对某些扩展名的 filetype 进行纠正
	au BufNewFile,BufRead *.as setlocal filetype=actionscript
	au BufNewFile,BufRead *.pro setlocal filetype=prolog
	au BufNewFile,BufRead *.es setlocal filetype=erlang
	au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	au BufNewFile,BufRead *.vl setlocal filetype=verilog

augroup END

"===============================================================
"输入法微调
"===============================================================
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

set ttimeout
set ttimeoutlen=50

set ruler
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h


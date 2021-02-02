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

" 设置自定义augroup
augroup user_events
	autocmd!
augroup END

" 初始化选项
let s:package_manager = 'dein'

function! s:main()
	" 初始化选择的包管理器
	call s:use_{s:package_manager}()
endfunction

function! s:use_dein()
	let l:cache_path = $DATA_PATH . '/dein'

	if has('vim_starting')
		" 使用dein作为插件管理器
		let g:dein#auto_recache = 1
		let g:dein#install_max_processes = 12
		let g:dein#install_progress_type = 'title'
		let g:dein#enable_notification = 1
		let g:dein#install_log_filename = $DATA_PATH . '/dein.log'

		" 将dein添加到vim的运行时路径
		if &runtimepath !~# '/dein.vim'
			let s:dein_dir = l:cache_path . '/repos/github.com/Shougo/dein.vim'
			" 如果是首次安装，请克隆dein
			if ! isdirectory(s:dein_dir)
				execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
				if v:shell_error
					call s:error('dein installation has failed! is git installed?')
					finish
				endif
			endif

			execute 'set runtimepath+='.substitute(
				\ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
		endif
	endif

	" 初始化dein.vim（软件包管理器）
	if dein#load_state(l:cache_path)

		" 开始传播文件路径和插件预设
		call dein#begin(l:cache_path, extend([expand('<sfile>')], s:config_paths))

		call dein#end()

		" 保存缓存状态以加快启动速度
		if ! g:dein#_is_sudo
			call dein#save_state()
		endif

		" 如果检测到更改，请更新或安装插件
		if dein#check_install()
			if ! has('nvim')
				set nomore
			endif
			call dein#install()
		endif
	endif

	filetype plugin indent on

	" 仅在vim启动时启用语法
	if has('vim_starting')
		syntax enable
	endif

	" 触发源事件挂钩
	call dein#call_hook('source')
	call dein#call_hook('post_source')
	autocmd VimEnter * call dein#call_hook('post_source')
endfunction


call s:main()












"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
set runtimepath+=/home/zyp/.config/nvim/dein/repos/github.com/Shougo/dein.vim
	call dein#begin('/home/zyp/.config/nvim/dein')

	"----------------------------------------------------------------------
	" 默认插件
	"----------------------------------------------------------------------

	call dein#add('https://github.com/haya14busa/dein-command.vim.git')


	if index(g:bundle_group, 'editor') >= 0

		call dein#add('https://hub.fastgit.org/jiangmiao/auto-pairs')
		call dein#add('https://hub.fastgit.org/mg979/vim-visual-multi')
		call dein#add('https://hub.fastgit.org/tomtom/tcomment_vim') " 在<space> cn中注释行
		call dein#add('https://hub.fastgit.org/jwarby/antovim.git') " gs切换
		call dein#add('https://hub.fastgit.org/tpope/vim-surround') " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
		call dein#add('https://hub.fastgit.org/gcmt/wildfire.vim') " in Visual mode, type i' to select all text in '', or type k) k] k} kp
		call dein#add('https://hub.fastgit.org/junegunn/vim-after-object') " da= to delete what's after =
		" call dein#add('https://hub.fastgit.org/tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
		"call dein#add('https://hub.fastgit.org/Konfekt/FastFold')
		"call dein#add('https://hub.fastgit.org/junegunn/vim-peekaboo')
		" call dein#add('https://hub.fastgit.org/wellle/context.vim'
		"call dein#add('https://hub.fastgit.org/svermeulen/vim-subversive')
		" call dein#add('https://hub.fastgit.org/theniceboy/argtextobj.vim'
		call dein#add('https://hub.fastgit.org/rhysd/clever-f.vim')
		call dein#add('https://hub.fastgit.org/chrisbra/NrrwRgn')
		" Find & Replace
		call dein#add('https://hub.fastgit.org/brooth/far.vim', { 'on_cmd': ['F', 'Far', 'Fardo'] })
		" call dein#add('https://hub.fastgit.org/AndrewRadev/splitjoin.vim'

	endif



	if index(g:bundle_group, 'debug') >= 0

		call dein#add('https://hub.fastgit.org/puremourning/vimspector')
		call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
		call dein#add('https://hub.fastgit.org/idanarye/vim-vebugger')


	endif






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


" minevim的版本信息
let g:minekvim_version = "0.0.1"

" 插件管理

" 设置自定义augroup
augroup user_events
	autocmd!
augroup END

" 初始化选项
let s:package_manager = 'dein'

" 将数据/缓存目录设置为 $XDG_CACHE_HOME/vim
let $DATA_PATH =
	\ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')

" 用户插件列表配置文件路径的集合
let s:config_paths = get(g:, 'etc_config_paths', [
	\ $VIM_PATH . '/core/plugins.yaml',
	\ $VIM_PATH . '/usr/vimrc.yaml',
	\ $VIM_PATH . '/usr/vimrc.json',
	\ $VIM_PATH . '/vimrc.yaml',
	\ $VIM_PATH . '/vimrc.json',
	\ ])

let s:user_plugins=expand($VIM_PATH.'/core/plugins.yaml')

function! s:main()
	call s:load_plugins(s:user_plugins)
	if has('vim_starting')
		" 在异国风情的myvimrc位置使用viminit技巧时，请立即添加路径.
		if &runtimepath !~# $VIM_PATH
			set runtimepath^=$VIM_PATH
		endif

		" 确保数据目录
		for s:path in [
				\ $DATA_PATH,
				\ $DATA_PATH . '/undo',
				\ $DATA_PATH . '/backup',
				\ $DATA_PATH . '/session',
				\ $VIM_PATH . '/spell' ]
			if ! isdirectory(s:path)
				call mkdir(s:path, 'p')
			endif
		endfor

		" python解释器设置
		if has('nvim')
			" Try using pyenv virtualenv called 'neovim'
			let l:virtualenv = ''
			if ! empty($PYENV_ROOT)
				let l:virtualenv = $PYENV_ROOT . '/versions/neovim/bin/python'
			endif
			if empty(l:virtualenv) || ! filereadable(l:virtualenv)
				" Fallback to old virtualenv location
				let l:virtualenv = $DATA_PATH . '/venv/neovim3/bin/python'
			endif
			if filereadable(l:virtualenv)
				let g:python3_host_prog = l:virtualenv
			endif

		elseif has('pythonx')
			if has('python3')
				set pyxversion=3
			elseif has('python')
				set pyxversion=2
			endif
		endif
	endif

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
		for plugin in l:rc
			call dein#add(plugin['repo'], extend(plugin, {}, 'keep'))
		endfor

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
	" call dein#call_hook('source')
	" call dein#call_hook('post_source')
endfunction



" vim: set ts=2 sw=2 tw=80 noet :

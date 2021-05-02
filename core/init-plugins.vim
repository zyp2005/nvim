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
	let g:bundle_group += ['Leaderf','extra','lsp','debug','vimtex']
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
		call dein#begin(l:cache_path)
		    call dein#load_toml($NVIM_PATH.'/core/plugin/basic.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/airline.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/asyncrun.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/calendar.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/lsp.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/debug.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/echo.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/editor.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/enhanced.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/filetypes.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/fzf.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/general_writing.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/Leaderf.toml')
			" call dein#load_toml($NVIM_PATH.'/core/plugin/quickui.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/textobj.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/vimtex.toml')
			call dein#load_toml($NVIM_PATH.'/core/plugin/vista.toml')
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
	autocmd VimEnter * call dein#call_hook('post_source')
endfunction


call s:main()


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


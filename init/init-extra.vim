if index(g:bundle_group, 'fzf') >= 0
	"===
	"=== fzf
	"===
	let g:fzf_preview_window = 'right:50%'
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
	let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7 } }
	let g:coc_fzf_preview = ''
	let g:coc_fzf_opts = []
endif


if index(g:bundle_group, 'calendar') >= 0
	" ===
	" === vim-calendar
	" ===
	"noremap \c :Calendar -position=here<CR>
	noremap \c :Calendar<CR>:q<cr>:Calendar -view=clock -position=tab<CR>
	"let g:calendar_google_calendar = 1
	"let g:calendar_google_task = 1
	let g:calendar_frame = 'default'
	augroup calendar-mappings
		autocmd!
		" diamond cursor
		autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
		autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
		autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
		autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
		autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
		autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
		autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
		autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
		autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
		autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
		" unmap <C-n>, <C-p> for other plugins
		autocmd FileType calendar nunmap <buffer> <C-n>
		autocmd FileType calendar nunmap <buffer> <C-p>
	augroup END
endif


if index(g:bundle_group, 'asyncrun') >= 0
	" ===
	" === AsyncRun
	" ===
	noremap gp :AsyncRun git push<CR>


	" ===
	" === AsyncTasks
	" ===
	let g:asyncrun_open = 6
	let g:asynctasks_term_pos = 'right'
	let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
	let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
	let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80
	noremap <silent><space><F3> :AsyncTask file-build<cr>
	noremap <silent><space><F5> :AsyncTask file-run<cr>
	noremap <M-q> :cclose<cr>
endif




if index(g:bundle_group, 'general_writing') >= 0
	" ===
	" === goyo
	" ===
	map <space>gy :Goyo<CR>



	"===
	"=== thesaurus_query
	"===
	"nnoremap  <space>cs :ThesaurusQueryReplaceCurrentWord<CR>
	let g:tq_enabled_backends=["cilin_txt",
				\"openthesaurus_de",
				\"yarn_synsets",
				\"openoffice_en",
				\"mthesaur_txt",
				\"datamuse_com",]
	let g:tq_language=['en', 'cn']
	let g:tq_cilin_txt_file="~/.config/nvim/thesaurus/cilin.txt"
endif


if index(g:bundle_group, 'editor') >= 0
	"===
	"===AutoPairs
	"===
	"let g:AutoPairsFlyMode = 1

	" ===
	" === vim-visual-multi
	" ===
	"let g:VM_theme             = 'iceblue'
	"let g:VM_default_mappings = 0
	"let g:VM_space                     = {'default': ',', 'visual': ',', 'buffer': ','}
	let g:VM_maps                       = {}
	"let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
	"let g:VM_maps['i']                  = 'k'
	"let g:VM_maps['I']                  = 'K'
	let g:VM_maps['Find Under']         = '<C-m>'
	let g:VM_maps['Find Subword Under'] = '<C-m>'
	"let g:VM_maps['Find Next']          = ''
	"let g:VM_maps['Find Prev']          = ''
	"let g:VM_maps['Remove Region']      = 'q'
	"let g:VM_maps['Skip Region']        = '<c-n>'
	"let g:VM_maps["Undo"]               = 'l'
	"let g:VM_maps["Redo"]               = '<C-r>'

	"==
	"== antovim
	"==
	nmap <space>q :Antovim<cr>
	autocmd FileType javascript let g:custom_antovim_definitions = [
				\   ['this', 'that']
				\ ]

	"==
	"== wildfire
	"==
	" This selects the next closest text object.
	"map <M-N> <Plug>(wildfire-fuel)
	" This selects the previous closest text object.
	"map <M-B> <Plug>(wildfire-water)

	" ===
	" === vim-after-object
	" ===
	autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

	" ===
	" === tcomment_vim
	" ===
	"nnoremap ci cl
	let g:tcomment_textobject_inlinecomment = ''
	nmap <space>cn g>c
	vmap <space>cn g>
	nmap <space>cu g<c
	vmap <space>cu g<

	" ===
	" === NrrwRgn
	" ===
	let g:nrrw_rgn_nomap_nr = 1
	let g:nrrw_rgn_nomap_Nr = 1
	noremap <space>nm :NR<CR>

	" ===
	" === Far.vim
	" ===
	noremap <space>FF :F  **/*<left><left><left><left><left>
	noremap <space>FD :Far  **/*<left><left><left><left><left>
	let g:far#mapping = {
				\ "replace_undo" : ["l"],
				\ }
	let g:far#auto_preview = 1
endif


if index(g:bundle_group, 'vimtex') >= 0
	" ===
	" === vimtex
	" ===
	let g:tex_flavor = 'latex'
	"let g:vimtex_view_method = ''
	let g:vimtex_view_general_viewer = 'llpp'
	let g:vimtex_mappings_enabled = 0
	let g:vimtex_text_obj_enabled = 0
	let g:vimtex_motion_enabled = 0
	let maplocalspace=' '
endif


if index(g:bundle_group, 'debug') >= 0
	let g:vebugger_path_gdb = "/usr/bin/gdb"

	" ===
	" === vimspector
	" ===
	let g:vimspector_enable_mappings = 'HUMAN'
	function! s:read_template_into_buffer(template)
		" has to be a function to avoid the extra space fzf#run insers otherwise
		execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
	endfunction
	command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
				\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
				\   'down': 20,
				\   'sink': function('<sid>read_template_into_buffer')
				\ })
	noremap <space>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
	sign define vimspectorBP text=☛ texthl=Normal
	sign define vimspectorBPDisabled text=☞ texthl=Normal
	"sign define vimspectorPC text=🔶 texthl=SpellBad
	let g:vimspector_sidebar_width = 30
	let g:vimspector_bottombar_height = 7
	let g:vimspector_code_minwidth = 70
	let g:vimspector_terminal_maxwidth = 100
	let g:vimspector_terminal_minwidth = 40
endif



if index(g:bundle_group, 'basic') >= 0
	"===
	"=== vim-easymotion
	"===
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

	" ===
	" === suda.vim
	" ===
	cnoreabbrev sudowrite w suda://%
	cnoreabbrev sw w suda://%

	"===
	"=== dashboard
	"===
	let g:dashboard_default_executive ='fzf'
	let g:dashboard_custom_header = [
				\ '',
				\ '                     ___   ___   ___  _____ ',
				\ '                    |__ \ / _ \ / _ \| ____|',
				\ '      _____   _ _ __   ) | | | | | | | |__  ',
				\ '     |_  / | | | |_ \ / /| | | | | | |___ \ ',
				\ '      / /| |_| | |_) / /_| |_| | |_| |___) |',
				\ '     /___|\__, | .__/____|\___/ \___/|____/ ',
				\ '           __/ | |                          ',
				\ '          |___/|_|                          ',
				\ ]
	nmap <space>nn :<C-u>DashboardNewFile<CR>
	let g:dashboard_custom_shortcut={
				\ 'last_session' : 'no map',
				\ 'find_history' : 'SPC s h',
				\ 'find_file' : 'SPC s f',
				\ 'new_file' : 'SPC c n',
				\ 'change_colorscheme' : 'SPC s c',
				\ 'find_word' : 'SPC s r',
				\ 'book_marks' : 'SPC m s',
				\ }


	"===
	"=== vim-floaterm
	"===
	let g:floaterm_width = 0.7
	let g:floaterm_height = 0.7
	let g:floaterm_winblend = 15
	" Configuration example
	hi Floaterm guibg=black
	hi FloatermBorder guibg=normal
	hi FloatermNC guibg=gray
	" autocmd User Startified setlocal buflisted
	let  g:floaterm_keymap_new     =  '<M-f><M-o>'
	""let  g:floaterm_keymap_next    =  '<C-f><C-n>'
	let g:floaterm_keymap_prev    =   '<M-f><M-p>'
	let  g:floaterm_keymap_next    =  '<M-f><M-n>'
	let  g:floaterm_keymap_kill    =  '<M-f><M-k>'
	let  g:floaterm_keymap_toggle  =  '<M-t>'
	nmap <M-f><M-o> :FloatermNew<cr>
	nmap <space>fl :CocList --auto-preview floaterm<CR>
	nmap  <space>fr :FloatermNew ranger<CR>
	nmap  <space>ff :FloatermNew fzf<CR>
	nmap  <space>fg :FloatermNew lazygit<CR>


	"===
	"=== gruvbox-material
	"===
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


	"===
	"=== vim-preview
	"===
	"小写p预览，大写P关掉
	autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
	autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


	"===
	"=== vim-choosewin
	"===
	" 使用 ALT+E 来选择窗口
	nmap <m-e> <Plug>(choosewin)


	"===
	"=== vim-snippets
	"===
	source ~/.config/nvim/md-snippets.vim
	" auto spell
	autocmd BufRead,BufNewFile *.md setlocal spell
endif


if index(g:bundle_group, 'enhanced') >= 0
	"===
	"=== tabular
	"===
	vmap <space>d :Tabularize /
	nmap <space>d :Tabularize /


	"===
	"=== vim-diff-enhanced
	"===
	if &diff
		let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
	endif


	"===
	"=== vim-autoformat
	"===
	nnoremap <space>\ :Autoformat<CR>
	let g:formatdef_custom_js = '"js-beautify -t"'
	let g:formatters_javascript = ['custom_js']
	au BufWrite *.js :Autoformat
	function! s:read_format_into_buffer(template)
		" has to be a function to avoid the extra space fzf#run insers otherwise
		execute '0r ~/.config/nvim/sample_format/'.a:template
	endfunction
	command! -bang -nargs=* LoadFormatTemplate call fzf#run({
				\   'source': 'ls -1 ~/.config/nvim/sample_format',
				\   'down': 20,
				\   'sink': function('<sid>read_format_into_buffer')
				\ })
	noremap <space>vl :tabe .clang-format<CR>:LoadFormatTemplate<CR>


	"===
	"=== undotree
	"===
	noremap <space>u :UndotreeToggle<CR>
	let g:undotree_DiffAutoOpen = 1
	let g:undotree_SetFocusWhenToggle = 1
	let g:undotree_ShortIndicators = 1
	let g:undotree_WindowLayout = 2
	let g:undotree_DiffpanelHeight = 8
	let g:undotree_SplitWidth = 24
	function g:Undotree_CustomMap()
		nmap <buffer> u <plug>UndotreeNextState
		nmap <buffer> e <plug>UndotreePreviousState
		nmap <buffer> U 5<plug>UndotreeNextState
		nmap <buffer> E 5<plug>UndotreePreviousState
	endfunc


	"===
	"=== rainbow
	"===
	let g:rainbow_active = 1


	"===
	"=== vim-translator
	"===
	"" <space>t 翻译光标下的文本，在命令行回显
	nmap <silent> <space>ty <Plug>(coc-translator-e)
	vmap <silent> <space>ty <Plug>TranslateV
	" space>w 翻译光标下的文本，在窗口中显示
	nmap <silent> <space>tw <Plug>(coc-translator-p)
	vmap <silent> <space>tw <Plug>TranslateWV
	" space>r 替换光标下的文本为翻译内容
	nmap <silent> <space>tr <Plug>TranslateR
	vmap <silent> <space>tr <Plug>TranslateRV
	let g:translator_window_max_width = 0.5


	"===
	"=== vim-whitespace
	"===
	let g:better_whitespace_enabled=1
	let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown','calendar','dashboard']
	nnoremap <silent><m-w> :StripWhitespace<cr>
	let g:better_whitespace_operator='<m-w>'


	"===
	"=== any-jump.vim
	"===
	" Normal mode: Jump to definition under cursore
	nnoremap <space>jj :AnyJump<CR>
	" Visual mode: jump to selected text in visual mode
	xnoremap <space>jj :AnyJumpVisual<CR>
	" Show line numbers in search rusults
	let g:any_jump_list_numbers = 1
	" Auto search references
	let g:any_jump_references_enabled = 1
	" Auto group results by filename
	let g:any_jump_grouping_enabled = 0
	" Amount of preview lines for each search result
	let g:any_jump_preview_lines_count = 5
	" Max search results, other results can be opened via [a]
	let g:any_jump_max_search_results = 10
	" Prefered search engine: rg or ag
	let g:any_jump_search_prefered_engine = 'rg'

	" Search results list styles:
	" - 'filename_first'
	" - 'filename_last'
	let g:any_jump_results_ui_style = 'filename_first'
	" Any-jump window size & position options
	let g:any_jump_window_width_ratio  = 0.6
	let g:any_jump_window_height_ratio = 0.6
	let g:any_jump_window_top_offset   = 4
	" Customize any-jump colors with extending default color scheme:
	let g:any_jump_colors = { "help": "Comment" }
	" Or override all default colors
	let g:any_jump_colors = {
				\"plain_text":         "Comment",
				\"preview":            "Comment",
				\"preview_keyword":    "Operator",
				\"heading_text":       "Function",
				\"heading_keyword":    "Identifier",
				\"group_text":         "Comment",
				\"group_name":         "Function",
				\"more_button":        "Operator",
				\"more_explain":       "Comment",
				\"result_line_number": "Comment",
				\"result_text":        "Statement",
				\"result_path":        "String",
				\"help":               "Comment"
				\}
	" Disable default any-jump keybindings (default: 0)
	let g:any_jump_disable_default_keybindings = 0
	" Remove comments line from search results (default: 1)
	let g:any_jump_remove_comments_from_results = 1
	" Custom ignore files
	" default is: ['*.tmp', '*.temp']
	let g:any_jump_ignored_files = ['*.tmp', '*.temp']
	" Search references only for current file type
	" (default: false, so will find keyword in all filetypes)
	let g:any_jump_references_only_for_current_filetype = 0
	" Disable search engine ignore vcs untracked files
	" (default: false, search engine will ignore vcs untracked files)
	let g:any_jump_disable_vcs_ignore = 0
	let g:any_jump_disable_default_keybindings = 1


	"===
	"=== vim-expand-region
	"===
	" ALT_+/- 用于按分隔符扩大缩小 v 选区
	map <m-=> <Plug>(expand_region_expand)
	map <m--> <Plug>(expand_region_shrink)
endif



if index(g:bundle_group, 'vista') >= 0
	"===
	"=== vista.vim
	"===
	noremap <space>vv :Vista coc<CR>
	noremap <space>vf :silent! Vista finder coc<CR>
	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
	let g:vista_default_executive = 'ctags'
	let g:vista_fzf_preview = ['right:50%']
	let g:vista#renderer#enable_icon = 1
	let g:vista#renderer#icons = {
				\   "function": "\uf794",
				\   "variable": "\uf71b",
				\  }
	function! NearestMethodOrFunction() abort
		return get(b:, 'vista_nearest_method_or_function', '')
	endfunction
	set statusline+=%{NearestMethodOrFunction()}
	" By default vista.vim never run if you don't call it explicitly.
	"
	" If you want to show the nearest function in your statusline automatically,
	" you can add the following line to your vimrc
	autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
	let g:vista_sidebar_width = 30
	let g:vista_cursor_delay = 100 "显示详细信息延迟"`scroll
	let g:vista_echo_cursor_strategy = 'echo'
	let g:vista_close_on_jump = 0
	let g:vista_update_on_text_changed_delay = 1
endif


if index(g:bundle_group, 'tags') >= 0
	"===
	"=== gutentags
	"===

	let g:gutentags_plus_nomap = 1

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


if index(g:bundle_group, 'filetypes') >= 0
	"===
	"=== markdown-preview.nvim
	"===
	let g:mkdp_auto_start = 0
	let g:mkdp_auto_close = 1
	let g:mkdp_refresh_slow = 0
	let g:mkdp_command_for_global = 0
	let g:mkdp_open_to_the_world = 0
	let g:mkdp_open_ip = ''
	let g:mkdp_echo_preview_url = 0
	let g:mkdp_browserfunc = ''
	let g:mkdp_preview_options = {
				\ 'mkit': {},
				\ 'katex': {},
				\ 'uml': {},
				\ 'maid': {},
				\ 'disable_sync_scroll': 0,
				\ 'sync_scroll_type': 'middle',
				\ 'hide_yaml_meta': 1
				\ }
	let g:mkdp_markdown_css = ''
	let g:mkdp_highlight_css = ''
	let g:mkdp_port = ''
	let g:mkdp_page_title = '「${name}」'
	" ===
	" === vim-table-mode
	" ===
	noremap <space>tm :TableModeToggle<CR>
	"let g:table_mode_disable_mappings = 1
	let g:table_mode_cell_text_object_i_map = 'k<Bar>'
	" ===
	" === Bullets.vim
	" ===
	" let g:bullets_set_mappings = 0
	let g:bullets_enabled_file_types = [
				\ 'markdown',
				\ 'text',
				\ 'gitcommit',
				\ 'scratch'
				\]
	" ===
	" === vim-markdown-toc
	" ===
	"let g:vmt_auto_update_on_save = 0
	"let g:vmt_dont_insert_fence = 1
	let g:vmt_cycle_list_item_markers = 1
	let g:vmt_fence_text = 'TOC'
	let g:vmt_fence_closing_text = '/TOC'
endif


if index(g:bundle_group, 'airline') >= 0
	"===
	"=== airline
	"===

	let g:airline_theme='gruvbox_material'
	let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体

	function! AirlineInit()
		let g:airline_section_b = '%{get(g:,"coc_git_status","")}%{get(b:,"coc_git_status","")}%{get(b:,"coc_git_blame","")}'
		let g:airline_section_a = airline#section#create_left(['mode','%{strftime("%m/%d-%H:%M")}', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
		let g:airline_section_c = airline#section#create(['%<', 'file','readonly'])
	endfunction
	autocmd User AirlineAfterInit call AirlineInit()
	let airline#extensions#coc#error_symbol = 'E:'
	let airline#extensions#coc#warning_symbol = 'W:'
	let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
	let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'


	"===
	"=== vim-wintabs
	"===
	let g:wintabs_ui_buffer_name_format = '%o:%t'
	nmap <M-[> <Plug>(wintabs_previous)
	nmap <M-]> <Plug>(wintabs_next)
	nmap <space>wc <Plug>(wintabs_close)
	nmap <space>wu <Plug>(wintabs_undo)
	nmap <space>wo <Plug>(wintabs_only)
	nmap <space>wwc <Plug>(wintabs_close_window)
	nmap <space>wwo <Plug>(wintabs_only_window)
	nmap <space>1 :WintabsGo 1<cr>
	nmap <space>2 :WintabsGo 2<cr>
	nmap <space>3 :WintabsGo 3<cr>
	nmap <space>4 :WintabsGo 4<cr>
	nmap <space>5 :WintabsGo 5<cr>
	nmap <space>6 :WintabsGo 6<cr>
	nmap <space>7 :WintabsGo 7<cr>
	nmap <space>8 :WintabsGo 8<cr>
	nmap <space>9 :WintabsGo 9<cr>
	nmap <space>wm :WintabsMove
endif


if index(g:bundle_group, 'grammer') >= 0
	"===
	"=== vim-grammarous
	"===
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


if index(g:bundle_group, 'ale') >= 0
	"===
	"=== ale
	"===
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


if index(g:bundle_group, 'echodoc') >= 0
	"===
	"=== echodoc
	"===
	set noshowmode
	let g:echodoc#enable_at_startup = 1
	let g:echodoc#type = 'echo'
endif



if index(g:bundle_group, 'Leaderf') >= 0
	"===
	"=== Leaderf
	"===
	" " CTRL+p 打开文件模糊匹配
	" let g:Lf_ShortcutF = '<c-p>'
	"
	" " ALT+n 打开 buffer 模糊匹配
	" let g:Lf_ShortcutB = '<m-n>'
	"
	" " CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
	" noremap <c-n> :LeaderfMru<cr>
	"
	" " ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
	" noremap <m-p> :LeaderfFunction!<cr>
	"
	" " ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
	" noremap <m-P> :LeaderfBufTag!<cr>
	"
	" " ALT+n 打开 buffer 列表进行模糊匹配
	" noremap <m-n> :LeaderfBuffer<cr>
	"
	" " ALT+m 全局 tags 模糊匹配
	" noremap <m-m> :LeaderfTag<cr>
	"
	" " 最大历史文件保存 2048 个
	" let g:Lf_MruMaxFiles = 2048
	"
	" " ui 定制
	" let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
	"
	" " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
	" let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
	" let g:Lf_WorkingDirectoryMode = 'Ac'
	" let g:Lf_WindowHeight = 0.30
	" let g:Lf_CacheDirectory = expand('~/.vim/cache')
	"
	" " 显示绝对路径
	" let g:Lf_ShowRelativePath = 0
	"
	" " 隐藏帮助
	" let g:Lf_HideHelp = 1
	"
	" " 模糊匹配忽略扩展名
	" let g:Lf_WildIgnore = {
	"			\ 'dir': ['.svn','.git','.hg'],
	"			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
	"			\ }
	"
	" " MRU 文件忽略扩展名
	" let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
	" let g:Lf_StlColorscheme = 'powerline'
	"
	" " 禁用 function/buftag 的预览功能，可以手动用 p 预览
	" let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
	"
	" " 使用 ESC 键可以直接退出 Leaderf 的 normal 模式
	" let g:Lf_NormalMap = {
	"			\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	"			\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
	"			\ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
	"			\ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
	"			\ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
	"			\ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
	"			\ }
endif



if index(g:bundle_group, 'coc') >= 0
	" ==
	" == Git
	" ==
	" navigate chunks of current buffer
	nmap <space>g- <Plug>(coc-git-prevchunk)
	nmap <space>g= <Plug>(coc-git-nextchunk)
	":CocCommand git.chunkInfo 在光标下显示块信息。
	nmap <space>gh <Plug>(coc-git-chunkinfo)
	":CocCommand git.showCommit 显示当前块的提交。
	nmap <space>gc <Plug>(coc-git-commit)
	" create text object for git chunks
	"omap ig <Plug>(coc-git-chunk-inner)
	"xmap ig <Plug>(coc-git-chunk-inner)
	"omap ag <Plug>(coc-git-chunk-outer)
	"xmap ag <Plug>(coc-git-chunk-outer)
	":CocCommand git.chunkUndo 撤消当前块。
	nmap <space>gu :CocCommand git.chunkUndo<CR>
	":CocCommand git.chunkStage 暂存当前块。
	nmap <space>gs :CocCommand git.chunkStage<CR>
	":CocCommand git.diffCached 在预览窗口中显示缓存的差异。
	nmap <space>gd :CocCommand git.diffCached<CR>
	":CocCommand git.browserOpen 在浏览器中打开当前行，支持github url。
	nmap <space>gw :CocCommand git.browserOpen<CR>
	":CocCommand git.foldUnchanged 折叠当前缓冲区的不变行。
	nmap <space>gf :CocCommand git.foldUnchanged<CR>
	":CocCommand git.toggleGutters 在符号列中切换git gutter。
	nmap <space>gt :CocCommand git.toggleGutters<CR>

	nmap <space>sc :CocList commits<CR>
	nmap <space>ga :CocList gstatus<CR>
	nmap <space>gb :CocList branches<CR>



	"===
	"=== bookmark
	"===
	nmap <silent> <space>mm :CocCommand bookmark.toggle<cr>
	nmap <silent> <space>mi :CocCommand bookmark.annotate<cr>
	nmap <silent> <space>mb :CocCommand bookmark.prev<cr>
	nmap <silent> <space>mn :CocCommand bookmark.next<cr>
	nmap <silent> <space>mcc :CocCommand bookmark.clearForCurrentFile<cr>
	nmap <silent> <space>mca :CocCommand bookmark.clearForAllFiles<cr>
	nmap <silent> <space>ms :CocList -A bookmark<cr>



	"===
	"=== coc.nvim
	"===
	" Always show the signcolumn, otherwise it would shift the text each time
	" diagnostics appear/become resolved.
	if has("patch-8.1.1564")
		" Recently vim can merge signcolumn and number column into one
		set signcolumn=number
	else
		set signcolumn=yes
	endif

	" Use tab for trigger completion with characters ahead and navigate.
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config.
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	" inoremap <silent><expr> <TAB>
	"   \ pumvisible() ? coc#_select_confirm() :
	"   \ coc#expandableOrJumpable() ?
	"   \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	"   \ <SID>check_back_space() ? "\<TAB>" :
	"   \ coc#refresh()
	"
	" function! s:check_back_space() abort
	"   let col = col('.') - 1
	"   return !col || getline('.')[col - 1]  =~# '\s'
	" endfunction

	" let g:coc_snippet_next = '<tab>'





	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-x> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
	if exists('*complete_info')
		inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif
	" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	"			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


	"" Use `[g` and `]g` to navigate diagnostics
	"nmap <silent> [g <Plug>(coc-diagnostic-prev)
	"nmap <silent> ]g <Plug>(coc-diagnostic-next)
	"
	"" GoTo code navigation.
	"nmap <silent> gd <Plug>(coc-definition)
	"nmap <silent> gy <Plug>(coc-type-definition)
	"nmap <silent> gi <Plug>(coc-implementation)
	"nmap <silent> gr <Plug>(coc-references)
	"
	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')
	"
	"" Symbol renaming.
	nmap <space>rn <Plug>(coc-rename)
	"
	"" Formatting selected code.
	xmap <space>fo  <Plug>(coc-format-selected)
	nmap <space>fo  <Plug>(coc-format-selected)
	"
	augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end
	"
	"" Applying codeAction to the selected region.
	"" Example: `<space>aap` for current paragraph
	"xmap <space>a  <Plug>(coc-codeaction-selected)
	"nmap <space>a  <Plug>(coc-codeaction-selected)
	"
	"" Remap keys for applying codeAction to the current buffer.
	"nmap <space>ac  <Plug>(coc-codeaction)
	"" Apply AutoFix to problem on the current line.
	"nmap <space>qf  <Plug>(coc-fix-current)
	"
	"" Map function and class text objects
	"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)
	"
	"" Use CTRL-S for selections ranges.
	"" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
	"nmap <silent> <C-s> <Plug>(coc-range-select)
	"xmap <silent> <C-s> <Plug>(coc-range-select)
	"
	"" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')
	"
	"" Add `:Fold` command to fold current buffer.
	"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
	"
	"" Add `:OR` command for organize imports of the current buffer.
	"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
	"
	"" Add (Neo)Vim's native statusline support.
	"" NOTE: Please see `:h coc-status` for integrations with external plugins that
	"" provide custom statusline: lightline.vim, vim-airline.
	"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
	"
	"" Mappings using CoCList:
	"" Show all diagnostics.
	"nnoremap <silent> <space>ap  :<C-u>CocList diagnostics<cr>
	"" Manage extensions.
	"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	"" Show commands.
	"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	"" Find symbol of current document.
	"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	"" Search workspace symbols.
	"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	"" Do default action for next item.
	"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	"" Do default action for previous item.
	"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	"" Resume latest coc list.
	"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
	let g:coc_global_extensions = [
				\ 'coc-actions',
				\ 'coc-diagnostic',
				\ 'coc-explorer',
				\ 'coc-gitignore',
				\ 'coc-lists',
				\ 'coc-prettier',
				\ 'coc-snippets',
				\ 'coc-syntax',
				\ 'coc-tasks',
				\ 'coc-todolist',
				\ 'coc-translator',
				\ 'coc-tsserver',
				\ 'coc-vimlsp',
				\ 'coc-highlight',
				\ 'coc-floaterm',
				\ 'coc-git',
				\ 'coc-yank']


	" Remap for do codeAction of selected region
	function! s:cocActionsOpenFromSelected(type) abort
		execute 'CocCommand actions.open ' . a:type
	endfunction
	xmap <silent> <space>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
	nmap <silent> <space>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

	" Open up coc-commands
	nnoremap <space>cc :CocCommand<CR>
	"打开coclist
	nnoremap <space>cl :CocList<CR>
	" Useful commands
	nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	nmap <space>rn <Plug>(coc-rename)
	nmap tt :CocCommand explorer<CR>
	" coctodolist
	nnoremap <space>tn :CocCommand todolist.create<CR>
	nnoremap <space>tl :CocList todolist<CR>
	nnoremap <space>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
	" coc-tasks
	noremap <silent> <space>ts :CocList tasks<CR>
	" coc-snippets
	" Use <C-l> for trigger snippet expand.
	imap <C-l> <Plug>(coc-snippets-expand)
	" Use <C-j> for select text for visual placeholder of snippet.
	vmap <C-j> <Plug>(coc-snippets-select)
	" Use <C-j> for jump to next placeholder, it's default of coc.nvim
	let g:coc_snippet_next = '<c-j>'
	" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
	let g:coc_snippet_prev = '<c-k>'
	" Use <C-j> for both expand and jump (make expand higher priority.)
	imap <C-j> <Plug>(coc-snippets-expand-jump)
	let g:snips_author = 'zyp2005'
	"
	nmap <silent> <space>- <Plug>(coc-diagnostic-prev)
	nmap <silent> <space>= <Plug>(coc-diagnostic-next)

	nmap <space>rf <Plug>(coc-refactor)

	if has('nvim-0.4.0') || has('patch-8.2.0750')
		nnoremap <silent><nowait><expr> <c-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>\<C-j>\<C-j>\<C-j>\<C-j>"
		nnoremap <silent><nowait><expr> <c-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<up>\<up>\<up>\<up>\<up>"
		inoremap <silent><nowait><expr> <c-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
		inoremap <silent><nowait><expr> <c-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
		vnoremap <silent><nowait><expr> <c-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>\<C-j>\<C-j>\<C-j>\<C-j>"
		vnoremap <silent><nowait><expr> <c-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<up>\<up>\<up>\<up>\<up>"
	endif
endif



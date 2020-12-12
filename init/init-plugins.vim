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
	let g:bundle_group = ['basic','enhanced', 'filetypes', 'textobj']
	let g:bundle_group += ['tags', 'airline',  'echodoc']
	let g:bundle_group += ['leaderf','extra','coc']
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
" 默认插
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

if index(g:bundle_group, 'coc') >= 0



" ==
" == Git
" ==
" navigate chunks of current buffer
nmap <leader>g- <Plug>(coc-git-prevchunk)
nmap <Leader>g= <Plug>(coc-git-nextchunk)
":CocCommand git.chunkInfo 在光标下显示块信息。
nmap <leader>gh <Plug>(coc-git-chunkinfo)
":CocCommand git.showCommit 显示当前块的提交。
nmap <leader>gc <Plug>(coc-git-commit)
" create text object for git chunks
"omap ig <Plug>(coc-git-chunk-inner)
"xmap ig <Plug>(coc-git-chunk-inner)
"omap ag <Plug>(coc-git-chunk-outer)
"xmap ag <Plug>(coc-git-chunk-outer)
":CocCommand git.chunkUndo 撤消当前块。
nmap <leader>gu :CocCommand git.chunkUndo<CR>
":CocCommand git.chunkStage 暂存当前块。
nmap <leader>gs :CocCommand git.chunkStage<CR>
":CocCommand git.diffCached 在预览窗口中显示缓存的差异。
nmap <leader>gd :CocCommand git.diffCached<CR>
":CocCommand git.browserOpen 在浏览器中打开当前行，支持github url。
nmap <leader>gw :CocCommand git.browserOpen<CR>
":CocCommand git.foldUnchanged 折叠当前缓冲区的不变行。
nmap <leader>gf :CocCommand git.foldUnchanged<CR>
":CocCommand git.toggleGutters 在符号列中切换git gutter。
nmap <leader>gt :CocCommand git.toggleGutters<CR>

nmap <leader>sc :CocList commits<CR>
nmap <leader>ga :CocList gstatus<CR>
nmap <leader>gb :CocList branches<CR>

nmap <silent> <space>mm :CocCommand bookmark.toggle<cr>
nmap <silent> <space>mi :CocCommand bookmark.annotate<cr>
nmap <silent> <space>mb :CocCommand bookmark.prev<cr>
nmap <silent> <space>mn :CocCommand bookmark.next<cr>
nmap <silent> <space>mcc :CocCommand bookmark.clearForCurrentFile<cr>
nmap <silent> <space>mca :CocCommand bookmark.clearForAllFiles<cr>
nmap <silent> <space>ms :CocList -A bookmark<cr>

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
nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
xmap <leader>fo  <Plug>(coc-format-selected)
nmap <leader>fo  <Plug>(coc-format-selected)
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
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
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
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Open up coc-commands
nnoremap <leader>cc :CocCommand<CR>
"打开coclist
nnoremap <space>cl :CocList<CR>
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
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
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

nmap <space>rf <Plug>(coc-refactor)



endif


"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

	" 展示开始画面
	Plug 'https://hub.fastgit.org/hardcoreplayers/dashboard-nvim.git'

	"浮动终端
	Plug 'https://hub.fastgit.org/voldikss/vim-floaterm' "s

	"  colorscheme
	Plug 'https://hub.fastgit.org/sainnhe/gruvbox-material'
	Plug 'https://hub.fastgit.org/rakr/vim-one'

	" 支持库，给其他插件用的函数库
	Plug 'https://hub.fastgit.org/xolox/vim-misc.git'

	" 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
	Plug 't9md/vim-choosewin'

	" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
	Plug 'https://hub.fastgit.org/skywind3000/vim-preview'

	" Git 支持
	Plug 'https://hub.fastgit.org/tpope/vim-fugitive'

	" 片段
	Plug 'https://hub.fastgit.org/honza/vim-snippets'

	let g:dashboard_default_executive ='clap'
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
	nmap <Leader>nn :<C-u>DashboardNewFile<CR>
	let g:dashboard_custom_shortcut={
				\ 'last_session' : 'no map',
				\ 'find_history' : 'SPC s h',
				\ 'find_file' : 'SPC s f',
				\ 'new_file' : 'SPC c n',
				\ 'change_colorscheme' : 'SPC s c',
				\ 'find_word' : 'SPC s r',
				\ 'book_marks' : 'SPC m s',
				\ }

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
	nmap <leader>fl :CocList --auto-preview floaterm<CR>
	nmap  <Leader>fr :FloatermNew ranger<CR>
	nmap  <Leader>ff :FloatermNew fzf<CR>
	nmap  <Leader>fg :FloatermNew lazygit<CR>

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

	"小写p预览，大写P关掉
	autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
	autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

	" 使用 ALT+E 来选择窗口
	nmap <m-e> <Plug>(choosewin)

	" Snippets
	source ~/.config/nvim/md-snippets.vim
	" auto spell
	autocmd BufRead,BufNewFile *.md setlocal spell

endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

	" Autoformat
	Plug 'https://hub.fastgit.org/Chiel92/vim-autoformat'

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
	Plug 'https://hub.fastgit.org/voldikss/vim-translator'

	" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
	Plug 'terryma/vim-expand-region'

	" 快速文件搜索
	Plug 'https://hub.fastgit.org/junegunn/fzf', { 'build': { -> fzf#install() } }
	Plug 'https://hub.fastgit.org/junegunn/fzf.vim'
	Plug 'https://hub.fastgit.org/pechorin/any-jump.vim'

	noremap <leader>u :UndotreeToggle<CR>
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

	let g:rainbow_active = 1

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

	let g:better_whitespace_enabled=1
	let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown','calendar','dashboard']
	nnoremap <silent><m-w> :StripWhitespace<cr>
	let g:better_whitespace_operator='<m-w>'

	let g:fzf_preview_window = 'right:50%'
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
	let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7 } }

	" Normal mode: Jump to definition under cursore
	nnoremap <leader>jj :AnyJump<CR>
	" Visual mode: jump to selected text in visual mode
	xnoremap <leader>jj :AnyJumpVisual<CR>
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


	Plug 'https://hub.fastgit.org/liuchengxu/vista.vim'

	" 提供 ctags/gtags 后台数据库自动更新功能
	Plug 'https://hub.fastgit.org/ludovicchabant/vim-gutentags'

	" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
	" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
	Plug 'https://hub.fastgit.org/skywind3000/gutentags_plus'

	noremap <LEADER>vv :Vista coc<CR>
	noremap <leader>vf :silent! Vista finder coc<CR>
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
	Plug 'https://hub.fastgit.org/Shougo/Shougo/echodoc.vim'
	set noshowmode
	let g:echodoc#enable_at_startup = 1
	let g:echodoc#type = 'echo'
endif


"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'leaderf') >= 0
	" 如果 vim 支持 python 则启用  Leaderf
	if has('python') || has('python3')
		Plug 'https://hub.fastgit.org/Yggdroot/LeaderF', { 'do': './install.sh' }

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



" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @zyp2005


" Checkout-list
"
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"if empty(glob('~/.local/share/dein/'))
"	silent !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
"	silent !sh ./installer.sh ~/.local/share/dein
"	autocmd VimEnter *  call dein#install()  | source $MYVIMRC
"endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

set vb t_vb=[?5h$<100>[?5l

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir

" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set noexpandtab  "缩进已制表符显示
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent  "打开自动缩进
set list        "显示空格
"set listchars=tab:\|\ ,trail:▫
set listchars=tab:▸\ ,trail:▫
set scrolloff=4
"set ttimeoutlen=0 "键码使用不同的超时的值，设置 'ttiomeoutlen' 为非负数。
"set timeout timeoutlen=1000 ttimeoutlen=1000
"set notimeout
filetype on                       "文件类型检查
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set laststatus=2
set incsearch
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
"set colorcolumn=100
set updatetime=1000
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"光标回到上次位置

set tags+=./tags;


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
tnoremap <C-Q> <C-\><C-N>:q<CR>
tnoremap <leader> <nop>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

"map R :source $MYVIMRC<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>re :e ~/thecw/nvim/init.vim<CR>

" Open Startify
"noremap <LEADER>st :Startify<CR>

" Undo operations
"noremap l u

" Insert Key
"noremap k i
"noremap K I

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>sw /\(\<\w\+\>\)\_s*\1

" Space to Tab
"noremap <LEADER>tb :%s/    /\t/g
vnoremap <LEADER>stb :s/    /\t/g

" Folding
noremap <silent> <LEADER>z za

" Open up lazygit
noremap \g :Git
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
"nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
"noremap <silent> u k
"noremap <silent> n h
"noremap <silent> e j
"noremap <silent> i l
"noremap <silent> gu gk
"noremap <silent> ge gj

" <c-k>/<c-j> keys for 5 times u/e (faster navigation)
noremap <silent> <c-k> 5k
noremap <silent> <c-j> 5j

" <c-h> key: go to the start of the line
noremap <silent> <c-h> 0
" <c-l> key: go to the end of the line
noremap <silent> <c-l> $

" Faster in-line navigation
noremap <c-n> 5w
noremap <c-b> 5b


" set h (same as n, cursor left) to 'end of word'
"noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap B 5<C-y>
noremap N 5<C-e>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-k> <ESC>A
inoremap <C-j> <ESC>I



" ===
" === Command Mode Cursor Movement
" ===
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
"cnoremap <M-b> <S-Left>
"cnoremap <M-w> <S-Right>


" ===
" === Searching
" ===
noremap - Nzz
noremap = nzz

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER><Right> <C-w>l<left> "右切屏
noremap <LEADER><Left> <C-w>h<left><left>  "左切屏
noremap <LEADER><Up> <C-w>k<left><left><left><left><left>     "上切屏
noremap <LEADER><Down> <C-w>j<left><left><left>   "下切屏
noremap <LEADER>w <C-w>w

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap s<Right> :set splitright<CR>:vsplit<CR>    "右分屏
noremap s<Left> :set nosplitright<CR>:vsplit<CR>:set splitright<CR> "左分屏
noremap s<Up> :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>"上分屏
noremap s<Down> :set splitbelow<CR>:split<CR>   "下分屏

" Resize splits with arrow keys
noremap <M-up> :res +5<CR>
noremap <M-down> :res -5<CR>
noremap <M-left> :vertical resize-5<CR>
noremap <M-right> :vertical resize+5<CR>

imap <M-h> <left>
imap <M-l> <right>
imap <M-j> <down>
imap <M-k> <up>


" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
"noremap <LEADER>q <C-w>j:q<CR>



" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tn :tabe<CR>
" Move around tabs with tn and ti
noremap t[ :-tabnext<CR>
noremap t] :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tj :-tabmove<CR>
noremap tk :+tabmove<CR>

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === Other useful stuff
" ===

"转到较新的文本状态
nnoremap g= g+

" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'sakura'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
inoremap <C-e> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +5<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap '' <Esc>/<++><CR>:nohlsearch<CR>c4l

" Splelling Check with <space>sc
"noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

"noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
"noremap tx :r !figlet

noremap <LEADER>- :lN<CR>
noremap <LEADER>= :lne<CR>

" find and replace
noremap \s :%s//<left>

" set wrap
"noremap <LEADER>sw :set wrap<CR>

" press F10 to show hlgroup
map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Compile function
"noremap r :call CompileRunGcc()<CR>
"func! CompileRunGcc()
"	exec "w"
"	if &filetype == 'c'
"		exec "!g++ % -g -o %<.out"
"		exec "!time ./%<.out"
"	elseif &filetype == 'cpp'
"		set splitbelow
"		exec "!g++ -std=c++11 % -Wall -o %<"
"		:sp
"		:res -15
"		:term ./%<
"	elseif &filetype == 'java'
"		exec "!javac %"
"		exec "!time java %<"
"	elseif &filetype == 'sh'
"		:!time bash %
"	elseif &filetype == 'python'
"		set splitbelow
"		:sp
"		:term python3 %
"	elseif &filetype == 'html'
"		silent! exec "!".g:mkdp_browser." % &"
"	elseif &filetype == 'markdown'
"		exec "MarkdownPreview"
"	elseif &filetype == 'tex'
"		silent! exec "VimtexStop"
"		silent! exec "VimtexCompile"
"	elseif &filetype == 'dart'
"		exec "CocCommand flutter.run -d ".g:flutter_default_device
"		CocCommand flutter.dev.openDevLog
"	elseif &filetype == 'javascript'
"		set splitbelow
"		:sp
"		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
"	elseif &filetype == 'go'
"		set splitbelow
"		:sp
"		:term go run .
"	endif
"endfunc

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

" ===
" === Install Plugins with Vim-Plug
" ===


call plug#begin('~/.config/nvim/plugged')

" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
Plug 'https://hub.fastgit.org/terryma/vim-expand-region'

" ALT_+/- 用于按分隔符扩大缩小 v 选区
map <m-=> <Plug>(expand_region_expand)
map <m--> <Plug>(expand_region_shrink)


Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'https://hub.fastgit.org/idanarye/vim-vebugger'
"Testing my own plugin
" Plug 'https://hub.fastgit.orgtheniceboy/vim-calc')
"Plug 'https://hub.fastgit.org/nvim-treesitter/nvim-treesitter', {'rev': '4f2689c','path':'.config/nvim/plugged','name':'nvim-treesitter'})
"Plug 'https://hub.fastgit.org/sheerun/vim-polyglot')
" Plug 'https://hub.fastgit.org/octol/vim-cpp-enhanced-highlight.git'
Plug 'https://hub.fastgit.org/jackguo380/vim-lsp-cxx-highlight.git'
Plug 'https://hub.fastgit.org/jaxbot/semantic-highlight.vim.git'
Plug 'https://hub.fastgit.org/justinmk/vim-syntax-extra.git'

" 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
Plug 'https://hub.fastgit.org/t9md/vim-choosewin'
" 使用 ALT+E 来选择窗口
nmap <m-e> <Plug>(choosewin)



" Pretty Dress
Plug 'https://hub.fastgit.org/sainnhe/gruvbox-material' "s
Plug 'https://hub.fastgit.org/ryanoasis/vim-devicons' "s
Plug 'https://hub.fastgit.org/rakr/vim-one' "ss
"Plug 'hardcoreplayers/oceanic-material')

Plug 'https://hub.fastgit.org/yianwillis/vimcdoc' "s
Plug 'https://hub.fastgit.org/ntpeters/vim-better-whitespace.git' "s
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plug 'https://hub.fastgit.org/voldikss/vim-translator' "s
let g:better_whitespace_enabled=1
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown','calendar','dashboard']
nnoremap <silent><m-w> :StripWhitespace<cr>
let g:better_whitespace_operator='<m-w>'


" Other visual enhancement
"Plug 'ryanoasis/vim-devicons')
Plug 'https://hub.fastgit.org/luochen1990/rainbow' "s
"Plug 'https://hub.fastgit.org/mg979/vim-xtabline')
"Plug 'https://hub.fastgit.org/wincent/terminus')
Plug 'https://hub.fastgit.org/zefei/vim-wintabs' "s
Plug 'https://hub.fastgit.org/zefei/vim-wintabs-powerline' "s


" Status line
Plug 'https://hub.fastgit.org/vim-airline/vim-airline' "s

" Plug 'https://hub.fastgit.org/hardcoreplayers/spaceline.vim.git'

" File navigation
"Plug 'https://hub.fastgit.org/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'https://hub.fastgit.org/Xuyuanp/nerdtree-git-plugin')
Plug 'https://hub.fastgit.org/junegunn/fzf', { 'build': { -> fzf#install() } } "s
Plug 'https://hub.fastgit.org/junegunn/fzf.vim' "s
Plug 'https://hub.fastgit.org/pechorin/any-jump.vim' "s
Plug 'https://hub.fastgit.org/voldikss/vim-floaterm' "s
"Plug 'https://hub.fastgit.org/airblade/vim-rooter'
Plug 'https://hub.fastgit.org/Yggdroot/LeaderF', { 'do': './install.sh' } "ss
"Plug 'https://hub.fastgit.org/liuchengxu/vim-clap', {'build': ':Clap install-binary!' })
Plug 'https://hub.fastgit.org/liuchengxu/vim-clap'
" Plug 'https://hub.fastgit.org/vn-ki/coc-clap'

" Taglist
Plug 'https://hub.fastgit.org/liuchengxu/vista.vim' "ss

" Auto Complete
Plug 'https://hub.fastgit.org/neoclide/coc.nvim', {'branch': 'release'} "ss
Plug 'https://hub.fastgit.org/Shougo/echodoc.vim.git' "ss
"Plug 'https://hub.fastgit.org/wellle/tmux-complete.vim')

" Snippets
"Plug 'https://hub.fastgit.org/SirVer/ultisnips')
Plug 'https://hub.fastgit.org/honza/vim-snippets' "ss

" Undo Tree
Plug 'https://hub.fastgit.org/mbbill/undotree' "ss

" Git
"Plug 'https://hub.fastgit.org/theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
"Plug 'https://hub.fastgit.org/fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'https://hub.fastgit.org/mhinz/vim-signify'
"Plug 'https://hub.fastgit.org/airblade/vim-gitgutter'
Plug 'https://hub.fastgit.org/tpope/vim-fugitive' "ss

" Autoformat
Plug 'https://hub.fastgit.org/Chiel92/vim-autoformat' "ss

" Markdown
Plug 'https://hub.fastgit.org/iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' , 'for' :['markdown', 'vim-plug'] } "ss
Plug 'https://hub.fastgit.org/dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] } "ss
Plug 'https://hub.fastgit.org/mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] } "ss
Plug 'https://hub.fastgit.org/dkarter/bullets.vim' "ss

"vimspector
Plug 'https://hub.fastgit.org/puremourning/vimspector' "ss

" Tex
Plug 'https://hub.fastgit.org/lervag/vimtex' "ss

"orgmode
Plug 'https://hub.fastgit.org/jceb/vim-orgmode', {'for': ['vim-plug', 'org']}


" Editor Enhancement


" Editor Enhancement
"Plug 'https://hub.fastgit.org/Raimondi/delimitMate')
Plug 'https://hub.fastgit.org/jiangmiao/auto-pairs'
Plug 'https://hub.fastgit.org/mg979/vim-visual-multi'
Plug 'https://hub.fastgit.org/tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'https://hub.fastgit.org/jwarby/antovim.git' " gs切换
Plug 'https://hub.fastgit.org/tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'https://hub.fastgit.org/gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'https://hub.fastgit.org/junegunn/vim-after-object' " da= to delete what's after =
Plug 'https://hub.fastgit.org/godlygeek/tabular' "s     ga, or :Tabularize <regex> to align
Plug 'https://hub.fastgit.org/tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'https://hub.fastgit.org/easymotion/vim-easymotion' "ssss
"Plug 'https://hub.fastgit.org/Konfekt/FastFold')
"Plug 'https://hub.fastgit.org/junegunn/vim-peekaboo')
" Plug 'https://hub.fastgit.org/wellle/context.vim'
"Plug 'https://hub.fastgit.org/svermeulen/vim-subversive')
Plug 'https://hub.fastgit.org/theniceboy/argtextobj.vim'
Plug 'https://hub.fastgit.org/rhysd/clever-f.vim'
Plug 'https://hub.fastgit.org/chrisbra/NrrwRgn'
Plug 'https://hub.fastgit.org/AndrewRadev/splitjoin.vim'

" For general writing
Plug 'https://hub.fastgit.org/junegunn/goyo.vim'
Plug 'https://hub.fastgit.org/reedes/vim-wordy'
Plug 'https://hub.fastgit.org/ron89/thesaurus_query.vim'

" Bookmarks
"Plug 'https://hub.fastgit.org/MattesGroeger/vim-bookmarks')

" Find & Replace
Plug 'https://hub.fastgit.org/brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Documentation
"Plug 'KabbAmine/zeavim.vim') " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'https://hub.fastgit.org/jceb/vim-orgmode')
"Plug 'https://hub.fastgit.org/mhinz/vim-startify')
Plug 'https://hub.fastgit.org/hardcoreplayers/dashboard-nvim.git'
Plug 'https://hub.fastgit.org/skywind3000/asynctasks.vim'
Plug 'https://hub.fastgit.org/skywind3000/asyncrun.vim'

" Vim Applications
Plug 'https://hub.fastgit.org/itchyny/calendar.vim'

" Other useful utilities
Plug 'https://hub.fastgit.org/skywind3000/vim-preview.git' "sss
Plug 'https://hub.fastgit.org/lambdalisue/suda.vim' " do stuff like :sudowrite
"Plug 'https://hub.fastgit.org/makerj/vim-pdf')
"Plug 'https://hub.fastgit.org/xolox/vim-session')
"Plug 'https://hub.fastgit.org/xolox/vim-misc') " vim-session dep

" Dependencies
" Plug 'https://hub.fastgit.org/MarcWeber/vim-addon-mw-utils')
" Plug 'https://hub.fastgit.org/kana/vim-textobj-user')
" Plug 'https://hub.fastgit.org/roxma/nvim-yarp')
Plug 'https://hub.fastgit.org/lifepillar/vim-gruvbox8.git'

call plug#end()
"call plug#begin('~/.config/nvim/plugged')
"Plug 'https://hub.fastgit.org/nvim-treesitter/nvim-treesitter', {'branch': '4f2689c'}'
"Plug 'https://hub.fastgit.org/nvim-treesitter/nvim-treesitter',{'tag': '4f2689c'}
"call plug#end()

filetype plugin indent on
syntax enable


let g:vebugger_path_gdb = "/usr/bin/gdb"
" experimental
set lazyredraw
"set regexpengine=1
syntax on
syntax enable


" ===
" === Dress up my vim
" ===
" set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

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
colorscheme gruvbox-material

"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"
"set background=dark    " Setting dark mode
"colorscheme deus
"let g:deus_termcolors=256
"let g:airline_theme='onedark'
let g:airline_theme='gruvbox_material'

"hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70


""colorscheme space-vim-dark
""set termguicolors
""hi Comment cterm=italic
"hi Normal       ctermbg=NONE guibg=NONE
"hi LineNr       ctermbg=NONE guibg=NONE
"hi SignColumn   ctermbg=NONE guibg=NONE
"hi Comment guifg=#5C6370 ctermbg=59
"hi Normal ctermbg=252 ctermbg=None




" ===================== Start of Plugin Settings =====================

" ===
" ===air-line
" ===
" " 解决菜单乱码
" "source $VIMRUNTIME/delmenu.vim
" "source $VIMRUNTIME/menu.vim
" " 解决consle输出乱码
" "set termencoding = cp936
" " 设置中文提示
" "language messages zh_CN.utf-8
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
" " 开启tabline
" "let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
" "let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
" "let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
" "let g:airline#extensions#tabline#buffer_nr_show = 1
" " 映射切换buffer的键位
let g:airline_section_b = '%{get(g:,"coc_git_status","")}%{get(b:,"coc_git_status","")}%{get(b:,"coc_git_blame","")}'
let g:airline_section_a = airline#section#create_left(['mode','%{strftime("%m/%d-%H:%M")}', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
let g:airline_section_c = airline#section#create(['%<', 'file','readonly'])
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
nnoremap b[ :bp<CR>
nnoremap b] :bn<CR>









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


" ===
" === any-jump
" ===
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

" ===
" === vim-floaterm
" ===
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


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" ===
" === Vista.vim
" ===
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

" ===
" === Undotree
" ===
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

" ===
" === AutoFormat
" ===
nnoremap <leader>\ :Autoformat<CR>
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
noremap <leader>vl :tabe .clang-format<CR>:LoadFormatTemplate<CR>

" ===
" === clap
" ===
"set rtp+=/usr/local/opt/fzf
"set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
"set rtp+=/home/david/.linuxbrew/opt/fzf
" let g:clap_default_external_filter = ["maple", "fzf"]
let g:clap_theme = 'material_design_dark'
noremap <silent> <leader>sf :Clap files ++finder=rg --ignore --hidden --files<CR>
noremap <silent> <leader>sr :Clap grep2<CR>
noremap <silent> <leader>sh :Clap history<CR>
noremap <silent> <leader>st :Clap tags<CR>
nnoremap <silent> <Leader>tc :<C-u>Clap colors<CR>
noremap <silent> <leader>sl :Clap lines<CR>
noremap <silent> <leader>sw :Clap buffers<CR>
noremap <silent> <leader>sb :Clap bcommits<CR>
"noremap <leader>f; :History:<CR>
let g:fzf_preview_window = 'right:50%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7 } }

"===
"===LeaderF
"===
"" Show icons, icons are shown by default
"let g:Lf_ShowDevIcons = 1
"" For GUI vim, the icon font can be specify like this, for example
"let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
"" If needs
""set ambiwidth=double
"
"let g:Lf_WindowPosition = 'popup' "cursor
"let g:Lf_ShortcutF = '<leader>lf'  "files
"let g:Lf_ShortcutB = '<leader>lw'  "butters
"let g:Lf_WildIgnore = {
"            \ 'dir': [],
"            \ 'file': []
"            \}      "忽略
"let g:Lf_StlSeparator = { 'left': '', 'right': '' }
"let g:Lf_PreviewCode = 1
"let g:Lf_PreviewResult = {
"            \ 'File': 0,
"            \ 'Buffer': 0,
"            \ 'Mru': 0,
"            \ 'Tag': 0,
"            \ 'BufTag': 1,
"            \ 'Function': 1,
"            \ 'Line': 0,
"            \ 'Colorscheme': 0,
"            \ 'Rg': 0,
"            \ 'Gtags': 0
"            \}
"let g:Lf_WorkingDirectoryMode = 'Af'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_WindowHeight = 0.3
"let g:Lf_ReverseOrder = 1
"let g:Lf_PreviewHorizontalPosition = 'bottom'

"===
"===vm-clap
"===
let g:clap_layout = {'width': '67%', 'height': '33%', 'row': '33%', 'col': '17%'}
let g:clap_layout = { 'relative': 'editor' }  "editor/current
let g:clap_theme = 'material_design_dark'
let g:clap_popup_border = 'rounded'
"let g:clap_insert_mode_only = v:true
let g:clap_search_box_border_style = 'curve'
let g:clap_enable_icon = 1
nmap J :Clap grep2 ++query=<cword><cr>


" ===
" === MarkdownPreview
" ===
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
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

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
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === vimtex
" ===
let g:tex_flavor = 'latex'
"let g:vimtex_view_method = ''
let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let maplocalleader=' '

"===
"===AutoPairs
"===
"let g:AutoPairsFlyMode = 1



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
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
"sign define vimspectorPC text=🔶 texthl=SpellBad
let g:vimspector_sidebar_width = 30
let g:vimspector_bottombar_height = 7
let g:vimspector_code_minwidth = 70
let g:vimspector_terminal_maxwidth = 100
let g:vimspector_terminal_minwidth = 40
" Set the basic sizes
"let g:vimspector_sidebar_width = 80
"let g:vimspector_code_minwidth = 85
"let g:vimspector_terminal_minwidth = 75
"
"function! s:CustomiseUI()
"  " Customise the basic UI...
"
"  " Close the output window
"  call win_gotoid( g:vimspector_session_windows.output )
"  q
"endfunction
"
"function s:SetUpTerminal()
"  " Customise the terminal window size/position
"  " For some reasons terminal buffers in Neovim have line numbers
"  call win_gotoid( g:vimspector_session_windows.terminal )
"  set norelativenumber nonumber
"endfunction
"
"augroup MyVimspectorUICustomistaion
"  autocmd!
"  autocmd User VimspectorUICreated call s:CustomiseUI()
"  autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
"augroup END




" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
"let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
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
"==nvim-treesitter
"==

"==
"== vim-wintabs
"==
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

" ===
" === rainbow
" ===
let g:rainbow_active = 1


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
" === tabular
" ===
vmap <space>d :Tabularize /
nmap <space>d :Tabularize /

" ===
" === vim-easymotion
" ===
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
" === fastfold
" ===
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1

" ===
" === context.vim
" ===
let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>
"let g:context_highlight_normal = 'PMenu'
let g:context_highlight_normal = 'PMenu'
let g:context_highlight_border = 'Comment'
let g:context_highlight_tag    = 'Special'

" ===
" === vim-subversive
" ===
"nmap s <plug>(SubversiveSubstitute)
"nmap ss <plug>(SubversiveSubstituteLine)

" ===
" === NrrwRgn
" ===
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
noremap <leader>nm :NR<CR>

" ===
" === tcomment_vim
" ===
"nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>


"nnoremap  <Leader>cs :ThesaurusQueryReplaceCurrentWord<CR>
let g:tq_enabled_backends=["cilin_txt",
			\"openthesaurus_de",
			\"yarn_synsets",
			\"openoffice_en",
			\"mthesaur_txt",
			\"datamuse_com",]
let g:tq_language=['en', 'cn']
let g:tq_cilin_txt_file="~/.config/nvim/thesaurus/cilin.txt"

"==
"==vim-bookmarks
"==
" let g:bookmark_no_default_key_mappings = 1
" nmap <space>mm <Plug>BookmarkToggle
" nmap <space>mi <Plug>BookmarkAnnotate
" nmap <space>ms <Plug>BookmarkShowAll
" nmap <space>mn <Plug>BookmarkNext
" nmap <space>mb <Plug>BookmarkPrev
" nmap <space>mcc <Plug>BookmarkClear
" nmap <space>mca <Plug>BookmarkClearAll
" " these will also work with a [count] prefix
" nmap <space>mk <Plug>BookmarkMoveUp
" nmap <space>mj <Plug>BookmarkMoveDown
" nmap <space>mg <Plug>BookmarkMoveToLine
nmap <silent> <space>mm :CocCommand bookmark.toggle<cr>
nmap <silent> <space>mi :CocCommand bookmark.annotate<cr>
nmap <silent> <space>mb :CocCommand bookmark.prev<cr>
nmap <silent> <space>mn :CocCommand bookmark.next<cr>
nmap <silent> <space>mcc :CocCommand bookmark.clearForCurrentFile<cr>
nmap <silent> <space>mca :CocCommand bookmark.clearForAllFiles<cr>
nmap <silent> <space>ms :CocList -A bookmark<cr>

" ===
" === Far.vim
" ===
noremap <LEADER>FF :F  **/*<left><left><left><left><left>
noremap <space>FD :Far  **/*<left><left><left><left><left>
let g:far#mapping = {
			\ "replace_undo" : ["l"],
			\ }
let g:far#auto_preview = 1

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


" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" ===
" === vim-session
" ===
"let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
"let g:session_command_aliases = 1
"set sessionoptions-=buffers
"set sessionoptions-=options
"noremap sl :OpenSession<CR>
"noremap sS :SaveSession<CR>
"noremap ss :SaveSession
"noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
"noremap so :OpenSession default<CR>
"noremap sD :DeleteSession<CR>
""noremap sA :AppendTabSession<CR>


"==
"== Open Startify
"==
"noremap <LEADER>st :Startify<CR>
" let g:startify_files_number = 10
" let g:startify_fortune_use_unicode = 1
" let g:startify_padding_left = 3
" let g:startify_custom_header =
"         \ startify#pad(split(system('figlet -f big "     zyp2005" && fortune -s'), '\n'))

"==
"== dashboard
"==
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



noremap  <m-u>：PreviewScroll -1 <cr>
noremap  <m-d>：PreviewScroll + 1 <cr>
inoremap  <m-u>  <c-\> <co>：PreviewScroll -1 <cr>
inoremap  <m-d>  <c-\> <co>：PreviewScroll + 1 <cr>

"==
"== vim-preview
"==
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


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



" ===
" === coc.nvim
" ===
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
			\ 'coc-json',
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

if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <c-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>\<C-j>\<C-j>\<C-j>\<C-j>"
	nnoremap <silent><nowait><expr> <c-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<up>\<up>\<up>\<up>\<up>"
	inoremap <silent><nowait><expr> <c-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <c-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <c-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>\<C-j>\<C-j>\<C-j>\<C-j>"
	vnoremap <silent><nowait><expr> <c-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<up>\<up>\<up>\<up>\<up>"
endif










"==
"== echodoc.vim
"==
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'echo'
" To use a custom highlight for the fLoat window,
" change Pmenu to your highlight group
"highlight link EchoDocFloat Pmenu




"
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"

""=
""==translate
""=
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
" ===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

" let g:semanticEnableFileTypes = ['c']

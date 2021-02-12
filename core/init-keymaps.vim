"======================================================================
"
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
" Created by zyp2005 on 2020/12/26
" Last Modified: 2018/05/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

" Set <LEADER> as <SPACE>, ; as :
if has('vim_starting')
	" 全局映射 "{{{
	" 使用空格键作为leader键,;作为第二leader键
	" 加载插件之前需要！
	let g:mapleader="\<Space>"
	" let g:maplocalleader=';'

	" 释放键映射前缀，完全退出以使用插件.
	nnoremap <Space>  <Nop>
	xnoremap <Space>  <Nop>
	nnoremap ,        <Nop>
	xnoremap ,        <Nop>
	nnoremap ;        <Nop>
	xnoremap ;        <Nop>
endif
noremap ; :

" Save & quit
" noremap Q :q<CR>
" nnoremap <C-q> :qa<CR>
" noremap S :w<CR>

"map R :source $MYVIMRC<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" <c-k>/<c-j> keys for 5 times u/e (faster navigation)
noremap <silent> <c-k> 5k
noremap <silent> <c-j> 5j

" <c-h> key: go to the start of the line
noremap <silent> <c-h> 0
" <c-l> key: go to the end of the line
noremap <silent> <c-l> $


" Ctrl + U or E will move up/down the view port without moving the cursor
noremap B 5<C-y>
noremap N 5<C-e>

" ===
" === Searching
" ===
noremap - Nzz
noremap = nzz

" ===
" === Window management
" ===

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

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

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

"转到较新的文本状态
nnoremap g= g+

" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'sakura'<CR><C-\><C-N>:q<CR>


" Opening a terminal window
noremap <leader>/ :call Term()<CR>
func! Term()
	set splitbelow
	:split
	:res +5
	:term
	:startinsert
endfunction


" Press space twice to jump to the next '<++>' and edit it
noremap '' <Esc>/<++><CR>:nohlsearch<CR>c4l


" Press ` to change case (instead of ~)
noremap ` ~

" Folding
noremap <silent> <LEADER>z za

" Call figlet
"noremap tx :r !figlet

noremap <LEADER>- :lN<CR>
noremap <LEADER>= :lne<CR>

" find and replace
noremap \s :%s//<left>
vnoremap \s :s//<left>

" press F7 to show hlgroup
noremap <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>



"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
" insert move
inoremap <M-h> <left>
inoremap <M-l> <right>
inoremap <M-j> <down>
inoremap <M-k> <up>

"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" <leader>+数字键 切换tab
"----------------------------------------------------------------------
" noremap <silent><leader>1 1gt<cr>
" noremap <silent><leader>2 2gt<cr>
" noremap <silent><leader>3 3gt<cr>
" noremap <silent><leader>4 4gt<cr>
" noremap <silent><leader>5 5gt<cr>
" noremap <silent><leader>6 6gt<cr>
" noremap <silent><leader>7 7gt<cr>
" noremap <silent><leader>8 8gt<cr>
" noremap <silent><leader>9 9gt<cr>
" noremap <silent><leader>0 10gt<cr>


"----------------------------------------------------------------------
" ALT+N 切换 tab
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>


" MacVim 允许 CMD+数字键快速切换标签
if has("gui_macvim")
	set macmeta
	noremap <silent><d-1> :tabn 1<cr>
	noremap <silent><d-2> :tabn 2<cr>
	noremap <silent><d-3> :tabn 3<cr>
	noremap <silent><d-4> :tabn 4<cr>
	noremap <silent><d-5> :tabn 5<cr>
	noremap <silent><d-6> :tabn 6<cr>
	noremap <silent><d-7> :tabn 7<cr>
	noremap <silent><d-8> :tabn 8<cr>
	noremap <silent><d-9> :tabn 9<cr>
	noremap <silent><d-0> :tabn 10<cr>
	inoremap <silent><d-1> <ESC>:tabn 1<cr>
	inoremap <silent><d-2> <ESC>:tabn 2<cr>
	inoremap <silent><d-3> <ESC>:tabn 3<cr>
	inoremap <silent><d-4> <ESC>:tabn 4<cr>
	inoremap <silent><d-5> <ESC>:tabn 5<cr>
	inoremap <silent><d-6> <ESC>:tabn 6<cr>
	inoremap <silent><d-7> <ESC>:tabn 7<cr>
	inoremap <silent><d-8> <ESC>:tabn 8<cr>
	inoremap <silent><d-9> <ESC>:tabn 9<cr>
	inoremap <silent><d-0> <ESC>:tabn 10<cr>
endif

"----------------------------------------------------------------------
" ALT 键移动增强
"----------------------------------------------------------------------

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
inoremap <c-b> <c-left>
inoremap <c-n> <c-right>
" Faster in-line navigation
noremap <c-n> 5w
noremap <c-b> 5b

" 命令模式下的相同快捷
cnoremap <c-b> <c-left>
cnoremap <c-n> <c-right>

" ALT+y 删除到行末
noremap <c-y> d$
inoremap <c-y> <c-\><c-o>d$


"----------------------------------------------------------------------
" 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER><Right> <C-w>l<left> "右切屏
noremap <LEADER><Left> <C-w>h<left><left>  "左切屏
noremap <LEADER><Up> <C-w>k<left><left><left><left><left>     "上切屏
noremap <LEADER><Down> <C-w>j<left><left><left>   "下切屏
" inoremap <m-H> <esc><c-w>h
" inoremap <m-L> <esc><c-w>l
" inoremap <m-J> <esc><c-w>j
" inoremap <m-K> <esc><c-w>k


let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
tnoremap <C-Q> <C-\><C-N>:q<CR>
" tnoremap <leader> <nop>
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



"----------------------------------------------------------------------
" 编译运行 C/C++ 项目
" 详细见：http://www.skywind.me/blog/archives/2084
"----------------------------------------------------------------------

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>




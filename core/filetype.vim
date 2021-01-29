
augroup user_plugin_filetype "{{{
  autocmd!
  " 自动重新加载vim配置
  autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
        \ source $MYVIMRC | redraw

  " 如果setlocal autoread自动重载vim脚本
  autocmd BufWritePost,FileWritePost *.vim nested
        \ if &l:autoread > 0 | source <afile> |
        \   echo 'source ' . bufname('%') |
        \ endif

  " 保存时更新文件类型（如果为空）
  autocmd BufWritePost * nested
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif

  " 仅在焦点窗口上突出显示当前行
  autocmd WinEnter,InsertLeave * if &ft !~# '^\(denite\|clap_\)' |
    \ set cursorline | endif

  autocmd WinLeave,InsertEnter * if &ft !~# '^\(denite\|clap_\)' |
    \ set nocursorline | endif

  " 自动为在其他位置编辑的文件设置只读
  autocmd SwapExists * nested let v:swapchoice = 'o'

  " 调整vim窗口大小时均衡窗口尺寸
  autocmd VimResized * tabdo wincmd =

  " 在离开nvim时强制写shada
  autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif

  " 检查文件是否在焦点对准窗口时更改，而不是“自动读取”
  autocmd FocusGained * checktime

  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

  autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

  " https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
  autocmd FileType css,javascript,javascriptreact setlocal backupcopy=yes

  " Go (Google)
  autocmd FileType go
                     \  let b:coc_pairs_disabled = ['<']
                     \ | let b:coc_root_patterns = ['.git', 'go.mod']

  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

  " Python
  autocmd FileType python
        \ setlocal expandtab smarttab nosmartindent
        \ | setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80

  " HTML (.gohtml and .tpl for server side)
  autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html

  " Make directory automatically.
  autocmd BufWritePre * call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)

  autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

augroup END "}}}

" Credits: https://github.com/Shougo/shougo-s-github/blob/master/vim/rc/options.rc.vim#L147
function! s:mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" FileType plugin config

"MaxMEllon/vim-jsx-pretty
if dein#tap('vim-jsx-pretty')
  let g:vim_jsx_pretty_highlight_close_tag = 1
endif

if dein#tap('html5.vim')
  let g:html5_event_handler_attributes_complete = 0
  let g:html5_rdfa_attributes_complete = 0
  let g:html5_microdata_attributes_complete = 0
  let g:html5_aria_attributes_complete = 0
endif

"" <space>t 翻译光标下的文本，在命令行回显
nmap <silent> <space>ty <Plug>Translate
vmap <silent> <space>ty <Plug>TranslateV
" space>w 翻译光标下的文本，在窗口中显示
nmap <silent> <space>tw <Plug>TranslateW
vmap <silent> <space>tw <Plug>TranslateWV
" space>r 替换光标下的文本为翻译内容
nmap <silent> <space>tr <Plug>TranslateR
vmap <silent> <space>tr <Plug>TranslateRV
let g:translator_window_max_width = 0.5


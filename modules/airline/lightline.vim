" let g:airline_theme='gruvbox_material'
" let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
"
" function! AirlineInit()
"	let g:airline_section_b = '%{get(g:,"coc_git_status","")}%{get(b:,"coc_git_status","")}%{get(b:,"coc_git_blame","")}'
"	let g:airline_section_a = airline#section#create_left(['mode','%{strftime("%m/%d-%H:%M")}', 'crypt', 'paste', 'keymap', 'spell', 'capslock', 'xkblayout', 'iminsert'])
"	let g:airline_section_c = airline#section#create(['%<', 'file','readonly'])
" endfunction
" autocmd User AirlineAfterInit call AirlineInit()
" let airline#extensions#coc#error_symbol = 'E:'
" let airline#extensions#coc#warning_symbol = 'W:'
" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'git','readonly', 'filename', 'modified'],['method' ] ],
	\   'right': [ ['cocstatus'],
	\            [ 'lineinfo' ],
	\            [ 'fileformat', 'fileencoding', 'filetype']],
	\ },
	\ 'inactive': {
	\  'left': [['filename']],
	\  'right': [],
	\},
	\ 'component_function': {
	\   'cocstatus': 'coc#status',
	\   'method': 'NearestMethodOrFunction',
	\   'filetype': 'MyFiletype',
	\   'fileformat': 'MyFileformat',
	\ },
	\ 'component' : {
	\   'git' : '%{get(g:,"coc_git_status","")}%{get(b:,"coc_git_status","")}%{get(b:,"coc_git_blame","")}',
	\   'mode': '%{lightline#mode()}',
	\   'absolutepath': '%F',
	\   'relativepath': '%f',
	\   'filename': '%t',
	\   'modified': '%M',
	\   'bufnum': '%n',
	\   'paste': '%{&paste?"PASTE":""}',
	\   'readonly': '%R',
	\   'charvalue': '%b',
	\   'charvaluehex': '%B',
	\   'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
	\   'fileformat': '%{&ff}',
	\   'filetype': '%{&ft!=#""?&ft:"no ft"}',
	\   'percent': '%3p%%',
	\   'percentwin': '%P',
	\   'spell': '%{&spell?&spelllang:""}',
	\   'lineinfo': '%3l(%L):%-2c',
	\   'line': '%l',
	\   'column': '%c',
	\   'close': '%999X X ',
	\   'winnr': '%{winnr()}'
	\ },
	\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" autocmd User CocGitStatusChange call lightline#update()
  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction

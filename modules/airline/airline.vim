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



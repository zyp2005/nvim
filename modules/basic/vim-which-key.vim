call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <leader><leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader><localleader> :<c-u>WhichKey  ','<CR>
let g:which_key_map =  {}

let g:which_key_map.t = {'name' : '+Translate'}
let g:which_key_map.v = {'name' : '+Vista/tabe'}
let g:which_key_map.s = {'name' : '+Coclist'}
let g:which_key_map.r = {'name' : '+Redo'}
let g:which_key_map.m = {'name' : '+Bookmark'}
let g:which_key_map.g = {'name' : '+Git'}
let g:which_key_map.w = {'name' : '+Windows'}
let g:which_key_map.f = {'name' : '+Float'}
let g:which_key_map.F = {'name' : '+Far'}
let g:which_key_map.e = {'name' : '+EasyMotion'}
let g:which_key_map.c = {'name' : '+Coc'}
let g:which_key_use_floating_win = 1
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'
let g:which_key_map['/'] = 'which_key_ignore'
let g:which_key_map.a = 'which_key_ignore'
let g:which_key_map['<CR>'] = 'which_key_ignore'

let g:which_key_disable_default_offset = 1
let g:which_key_centered = 0

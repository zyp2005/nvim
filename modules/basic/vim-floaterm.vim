let  g:floaterm_keymap_new     =  '<M-f><M-o>'
let g:floaterm_keymap_prev    =   '<M-f><M-p>'
let  g:floaterm_keymap_next    =  '<M-f><M-n>'
let  g:floaterm_keymap_kill    =  '<M-f><M-k>'
let  g:floaterm_keymap_toggle  =  '<M-f><M-h>'
nmap <M-f><M-o> :FloatermNew<cr>
nmap <space>fl :CocList --auto-preview floaterm<CR>
nmap  <space>fr :FloatermNew ranger<CR>
nmap  <space>ff :FloatermNew fzf<CR>
nmap  <space>fg :FloatermNew lazygit<CR>
let g:floaterm_width = 0.7
let g:floaterm_height = 0.7
let g:floaterm_winblend = 15
" Configuration example
hi Floaterm guibg=black
hi FloatermBorder guibg=normal
hi FloatermNC guibg=gray
" autocmd User Startified setlocal buflisted




noremap <silent><space><F3> :AsyncTask file-build<cr>
noremap <silent><space><F5> :AsyncTask file-run<cr>

let g:asyncrun_open = 6
let g:asynctasks_term_pos = 'right'
let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80

function! s:run_floaterm(opts)
	let cwd = getcwd()
	let cmd = 'cd ' . shellescape(cwd) . ' && ' . a:opts.cmd
	execute 'FloatermNew --position=topright --height=0.4 --width=0.5 --title=floaterm_runner --autoclose=0 ' . cmd
	" Back to the normal mode
	" stopinsert
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.floaterm = function('s:run_floaterm')
let g:asynctasks_term_pos = 'floaterm'

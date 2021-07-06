noremap <silent><space><F3> :AsyncTask file-build<cr>
noremap <silent><space><F5> :AsyncTask file-run<cr>

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

function! s:fzf_sink(what)
	let p1 = stridx(a:what, '<')
	if p1 >= 0
		let name = strpart(a:what, 0, p1)
		let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
		if name != ''
			exec "AsyncTask ". fnameescape(name)
		endif
	endif
endfunction

function! s:fzf_task()
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	let opts = { 'source': source, 'sink': function('s:fzf_sink'),
				\ 'options': '+m --nth 1 --inline-info --tac' }
	if exists('g:fzf_layout')
		for key in keys(g:fzf_layout)
			let opts[key] = deepcopy(g:fzf_layout[key])
		endfor
	endif
	call fzf#run(opts)
endfunction

command! -nargs=0 AsyncTaskFzf call s:fzf_task()


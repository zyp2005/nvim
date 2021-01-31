nnoremap <space>\ :Autoformat<CR>
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
noremap <space>vl :tabe .clang-format<CR>:LoadFormatTemplate<CR>



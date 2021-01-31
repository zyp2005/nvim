let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_header = [
			\ '',
			\ '                     ___   ___   ___  _____ ',
			\ '                    |__ \ / _ \ / _ \| ____|',
			\ '      _____   _ _ __   ) | | | | | | | |__  ',
			\ '     |_  / | | | |_ \ / /| | | | | | |___ \ ',
			\ '      / /| |_| | |_) / /_| |_| | |_| |___) |',
			\ '     /___|\__, | .__/____|\___/ \___/|____/ ',
			\ '           __/ | |                          ',
			\ '          |___/|_|                          ',
			\ ]
nmap <space>nn :<C-u>DashboardNewFile<CR>
let g:dashboard_custom_shortcut={
			\ 'last_session' : 'no map',
			\ 'find_history' : 'SPC s h',
			\ 'find_file' : 'SPC s f',
			\ 'new_file' : 'SPC c n',
			\ 'change_colorscheme' : 'SPC s c',
			\ 'find_word' : 'SPC s r',
			\ 'book_marks' : 'SPC m s',
			\ }



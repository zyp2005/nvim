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
let g:dashboard_custom_section = {
			\ 'last_session'        :{
			\ 'description': ['  Reload last session                   no     '],
			\ 'command': 'SessionLoad'},
			\ 'find_history'        :{
			\ 'description': ['  Recently opened files                 no     '],
			\ 'command': 'DashboardFindHistory'},
			\ 'find_file'           :{
			\ 'description': ['  Find File                             no     '],
			\ 'command': 'DashboardFindFile'},
			\ 'change_colorscheme'  :{
			\ 'description': ['  Change Colorscheme                    no     '],
			\ 'command': 'DashboardChangeColorscheme'},
			\ 'find_word'           :{
			\ 'description': ['  Find word                             no     '],
			\ 'command': 'DashboardFindWord'},
			\ 'book_marks'          :{
			\ 'description': ['  Jump to bookmark                      SPC m l'],
			\ 'command': 'BookmarkShowAll'},
			\ 'open_personal'       :{
			\ 'description': ['  Open Personal Config File             no     '],
			\ 'command': 'Clap personalconf'},
			\}


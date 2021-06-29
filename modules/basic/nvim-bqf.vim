
" :h CocLocationsChange for detail
let g:coc_enable_locationlist = 0
aug Coc
    au!
    au User CocLocationsChange ++nested call Coc_qf_jump2loc(g:coc_jump_locations)
aug END

" if you use coc-fzf, you should disable its CocLocationsChange event make
" bqf work for <Plug>(coc-references)
" au VimEnter * au! CocFzfLocation User CocLocationsChange

function! Coc_qf_diagnostic() abort
    let diagnostic_list = CocAction('diagnosticList')
    let items = []
    let loc_ranges = []
    for d in diagnostic_list
        let text = printf('[%s%s] %s', (empty(d.source) ? 'coc.nvim' : d.source),
                    \ (d.code ? ' ' . d.code : ''), split(d.message, '\n')[0])
        let item = {'filename': d.file, 'lnum': d.lnum, 'col': d.col, 'text': text, 'type':
                    \ d.severity[0]}
        call add(loc_ranges, d.location.range)
        call add(items, item)
    endfor
    call setqflist([], ' ', {'title': 'CocDiagnosticList', 'items': items,
                \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
    botright copen
endfunction

function! Coc_qf_jump2loc(locs) abort
    let loc_ranges = map(deepcopy(a:locs), 'v:val.range')
    call setloclist(0, [], ' ', {'title': 'CocLocationList', 'items': a:locs,
                \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
    let winid = getloclist(0, {'winid': 0}).winid
    if winid == 0
        aboveleft lwindow
    else
        call win_gotoid(winid)
    endif
endfunction

highlight BqfPreviewBorder guifg=#50a14f ctermfg=71
highlight link BqfPreviewRange IncSearch

lua <<EOF
require('bqf').setup({
    auto_enable = true,
    preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        --border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'}
    },
    filter = {
        fzf = {
            extra_opts = {'--bind', 'ctrl-a:toggle-all', '--prompt', '> '}
        }
    }
})
EOF

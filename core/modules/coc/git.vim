" navigate chunks of current buffer
nmap <space>g- <Plug>(coc-git-prevchunk)
nmap <space>g= <Plug>(coc-git-nextchunk)
":CocCommand git.chunkInfo 在光标下显示块信息。
nmap <space>gh <Plug>(coc-git-chunkinfo)
":CocCommand git.showCommit 显示当前块的提交。
nmap <space>gc <Plug>(coc-git-commit)
" create text object for git chunks
"omap ig <Plug>(coc-git-chunk-inner)
"xmap ig <Plug>(coc-git-chunk-inner)
"omap ag <Plug>(coc-git-chunk-outer)
"xmap ag <Plug>(coc-git-chunk-outer)
":CocCommand git.chunkUndo 撤消当前块。
nmap <space>gu :CocCommand git.chunkUndo<CR>
":CocCommand git.chunkStage 暂存当前块。
nmap <space>gs :CocCommand git.chunkStage<CR>
":CocCommand git.diffCached 在预览窗口中显示缓存的差异。
nmap <space>gd :CocCommand git.diffCached<CR>
":CocCommand git.browserOpen 在浏览器中打开当前行，支持github url。
nmap <space>gw :CocCommand git.browserOpen<CR>
":CocCommand git.foldUnchanged 折叠当前缓冲区的不变行。
nmap <space>gf :CocCommand git.foldUnchanged<CR>
":CocCommand git.toggleGutters 在符号列中切换git gutter。
nmap <space>gt :CocCommand git.toggleGutters<CR>

nmap <space>sc :CocList commits<CR>
nmap <space>ga :CocList gstatus<CR>
nmap <space>gb :CocList branches<CR>




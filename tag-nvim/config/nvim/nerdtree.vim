"" NERDTree
let NERDTreeMinimalUI = 1

let NERDTreeIgnore=[
\   '\.pyc$',
\   '\.pyo$',
\   '\.rbc$',
\   '\.rbo$',
\   '\.class$',
\   '\.o$',
\   '\~$',
\   'node_modules$',
\   '\.DS_Store$'
\ ]
" nmap <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>
nmap <leader>n :NERDTreeToggle<CR>

" https://github.com/scrooloose/nerdtree/issues/21#issuecomment-907483
" Auto close vim if nerdtree last buffer left
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
" function! s:CloseIfOnlyNerdTreeLeft()
"   if exists("t:NERDTreeBufName")
"     if bufwinnr(t:NERDTreeBufName) != -1
"       if winnr("$") == 1
"         q
"       endif
"     endif
"   endif
" endfunction


" https://www.reddit.com/r/vim/comments/g47z4f/synchronizing_nerdtree_with_the_currently_opened/
" Check if NERDTree is open or active
" function! IsNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction
" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufRead * call SyncTree()
" autocmd BufEnter * call SyncTree()
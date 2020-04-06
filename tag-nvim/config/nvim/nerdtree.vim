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
nmap <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" https://github.com/scrooloose/nerdtree/issues/21#issuecomment-907483
" Auto close vim if nerdtree last buffer left
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
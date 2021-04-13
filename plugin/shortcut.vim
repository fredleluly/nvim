noremap <leader>c "+y
" Python auto run
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd Filetype javascript nnoremap <F5> :w <cr>:exec '!node %' <cr>
autocmd Filetype js nnoremap <F5> :w <cr>:exec '!node %' <cr>

" Shortcut for esc
inoremap kj <ESC> 
cnoremap kj <ESC> 
inoremap jk <Esc>

nnoremap <C-s> :w<CR>

augroup compileandrun
autocmd filetype cpp nnoremap <f5> :w <bar> !g++ -std=c++11 % <cr> :vnew <bar> :te "./a.out" <cr><cr>
augroup END


" -------------------- window ----------------------------

" Split Window.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"let NERDTreeQuitOnOpen=1
map <F2> :NERDTreeToggle<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" window horiz to vertical and otherwise
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K
" resize window
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" set terminal python
map <leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k 
tmap <Esc> <C-\><C-n>

" tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <leader>w :bd<CR>

" -------------------- window ----------------------------


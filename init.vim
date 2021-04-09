" -------------------- comment ----------------------------
" clipboard use "+y
" easymotion <leader><leader>w "good to know
"
" <C-o> and <C-i> useful for go and back to definition 
" -------------------- comment ----------------------------

" -------------------- defalt  ----------------------------
" source ~/.config/nvim/lua/init.lua

syntax on
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
set nowrap
set incsearch
set scrolloff=7
set noswapfile
let mapleader = ' '
" -------------------- defalt  ----------------------------


call plug#begin('~/.config/nvim/plugged')
" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'

" Function
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'sirver/ultisnips'
Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'
Plug 'kien/ctrlp.vim'                " super searching ctrl p
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

" sweet functions
Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'
"Plug 'KKPMW/vim-sendtowindow'        " send commands to REPL

" completion
"Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
"Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
"Plug 'ncm2/ncm2-bufword'             " complete words in buffer
"Plug 'ncm2/ncm2-path'                " complete paths
Plug 'davidhalter/jedi-vim'


" Server
" coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
" default lsp from nvim
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'prabirshrestha/vim-lsp'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
call plug#end()




" -------------------- config ----------------------------
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')
" -------------------- config ----------------------------




" -------------------- setting plugin ----------------------------


 "ncm2 
"autocmd BufEnter * call ncm2#enable_for_buffer()      " enable ncm2 for all buffers
"set completeopt=noinsert,menuone,noselect             " IMPORTANT: :help Ncm2PopupOpen for more information
"let g:python3_host_prog='/usr/bin/python3'            " ncm2-jedi

" colorscheme
colorscheme gruvbox
"let g:airline_theme='gruvbox'

if has(("termguicolors"))
    set termguicolors
endif 
lua require 'colorizer'.setup()

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv


" Ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" -------------------- setting plugin ----------------------------






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
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <leader>w :bd<CR>

" -------------------- window ----------------------------

" -------------------- useful shortcut ----------------------------
" Python auto run
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" Shortcut for esc
inoremap kj <ESC> 
cnoremap kj <ESC> 
" -------------------- useful shortcut ----------------------------
"
" -------------------- LSP ----------------------------------------
source ~/.config/nvim/lua/pyright.vim
source ~/.config/nvim/lua/shortcut.vim

" -------------------- config lsp----------------------------
" settings for pyls
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    " use omnifunc if you are fine with it.
    " setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " some mappings to use, tweak as you wish.
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" -------------------- config lsp ----------------------------
" ------------------------------------------------------- 
"telescope
 "Find files using Telescope command-line sugar.
 "nnoremap <leader>ff <cmd>Telescope find_files<cr>
 "nnoremap <leader>fg <cmd>Telescope live_grep<cr>
 "nnoremap <leader>fb <cmd>Telescope buffers<cr>
 "nnoremap <leader>fh <cmd>Telescope help_tags<cr>

 " Using lua functions
 "nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
 "nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
 "nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
 "nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>"
" ------------------------------------------------------- 
"nnoremap <leader>r :AirlineRefresh<cr>

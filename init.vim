" -------------------- comment --------------------------------
" clipboard use "+y
" easymotion <leader><leader>w "good to know
"
" <C-o> and <C-i> useful for go and back to definition 
"
" -------------------- comment ---------------------------------
" -------------------- required --------------------------------
" required
" pylint
" pyright
" pyls
" coc
" deoplete
" -------------------- required --------------------------------

" -------------------- defalt  ---------------------------------
" source ~/.config/nvim/lua/init.lua

" -------------------- autocomplete ----------------------------
"
" coc 
" pyright
" pyls
" black if you need format
" davidhalter jedi
"
" -------------------- autocomplete ----------------------------
" -------------------- search file  ----------------------------
"  telescope required ripgrep (rg)
"   -ff
"   -fg
"   -fb
"   -fh
"  ctrlp
"   -C-p
"  nerdtree
"   -<F2>
" -------------------- search file  ----------------------------

" ----------------------  keyring   ----------------------------
"  s-d delete rest of the line
"  s-c delete rest of the line and insert mode
"  s-s delete line and insert mode
"  s for delete from "for" to *or*
"  a insert from from |word to w|ord
"  leader leader w easymotion
"  leader tp new python terminal
"  <F9> run python code
"  C-J to switch window to up
"  C-k to switch window to down
"  C-h to switch window to left
"  C-l to switch window to right
"  :sp to split
"  leader 1 to change tab to left
"  leader 2 to change tab to right
"  leader w to close the tab 
"  gd to got to definition
"  <F2> to toggle the nerdtree
"  C-/ to toggle nerdcommenter
"  C-> to incrase window size
"  C-< to incrase window size
"  leader th to switch from horiz to vertical 
"  leader tv to switch from vertical to vertical 
"  C-p to search file in project
" ----------------------  keyring   ----------------------------

syntax on
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
"set nowrap
set incsearch
set scrolloff=7
set noswapfile
let mapleader = ' '
set colorcolumn=112
set signcolumn=yes
"personal
"set cmdheight=2
set clipboard=unnamedplus
" -------------------- defalt  ----------------------------


call plug#begin('~/.config/nvim/plugged')
" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'joshdick/onedark.vim'

" Function
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'sirver/ultisnips'
Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'
"Plug 'kien/ctrlp.vim'                " super searching ctrl p
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" sweet functions
Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'
"Plug 'KKPMW/vim-sendtowindow'        " send commands to REPL

" completion
"Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
"Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
"Plug 'ncm2/ncm2-bufword'             " complete words in buffer
"Plug 'ncm2/ncm2-path'                " complete paths
"Plug 'davidhalter/jedi-vim'
" same as 174 line

" Server
" coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" default lsp from nvim
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" if you want to active in line 174
Plug 'prabirshrestha/vim-lsp'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'

call plug#end()


" -------------------- config ----------------------------
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')
" -------------------- config ----------------------------

" -------------------- setting plugin ----------------------------

" coc plugin in https://www.chrisatmachine.com/Neovim/04-vim-coc/


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
let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" -------------------- setting plugin ----------------------------

" -------------------- window ----------------------------
source ~/.config/nvim/plug-config/windows.vim
" -------------------- window ----------------------------

" -------------------- useful shortcut ----------------------------
" Python auto run
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" Shortcut for esc
inoremap kj <ESC> 
cnoremap kj <ESC> 
" -------------------- useful shortcut ----------------------------
"nnoremap <leader>r :AirlineRefresh<cr>

" -------------------- config lsp----------------------------
" settings for pyls
" from this to

"if executable('pyls')
    "" pip install python-language-server
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'pyls',
        "\ 'cmd': {server_info->['pyls']},
        "\ 'allowlist': ['python'],
        "\ })
"endif

"function! s:on_lsp_buffer_enabled() abort
    "" use omnifunc if you are fine with it.
    "" setlocal omnifunc=lsp#complete
    "if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    "" some mappings to use, tweak as you wish.
    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> gr <plug>(lsp-references)
    "nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    "nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    "nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    "nmap <buffer> K <plug>(lsp-hover)
"endfunction

"augroup lsp_install
    "au!
    "" call s:on_lsp_buffer_enabled only for languages that has the server registered.
    "autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END

" to this A pilihan autocomplete

" -------------------- config lsp ----------------------------
" OR!
" -------------------- turn of /on pyls autocomplete---------------------------- 
"autocmd BufEnter * lua require'completion'.on_attach()
"lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
"source $HOME/.config/nvim/autocomplete/pyls.vim
" -------------------- turn of / on pyls auto complete  ---------------------------- 

" -------------------- telescope  ---------------------------- 
"telescope
source $HOME/.config/nvim/plug-config/telescope.vim

 "Find files using Telescope command-line sugar.
 "nnoremap <leader>ff <cmd>Telescope find_files<cr>
 "nnoremap <leader>fg <cmd>Telescope live_grep<cr>
 "nnoremap <leader>fb <cmd>Telescope buffers<cr>
 "nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  "Using lua functions
 "nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
 "nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
 "nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
 "nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>"
"lua << EOF
"require('telescope').setup{
  "defaults = {
    "vimgrep_arguments = {
      "'rg',
      "'--color=never',
      "'--no-heading',
      "'--with-filename',
      "'--line-number',
      "'--column',
      "'--smart-case'
    "},
    "prompt_position = "bottom", 
    "prompt_prefix = ">",
    "selection_strategy = "reset",
    "sorting_strategy = "descending",
    "layout_strategy = "horizontal",
    "layout_defaults = {},
    "file_ignore_patterns = {},
    "shorten_path = true,
    "winblend = 0,
    "width = 0.75,
    "preview_cutoff = 120,
    "results_height = 1,
    "results_width = 0.8,
    "border = {},
    "borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    "color_devicons = true,
    "use_less = true,
  "}
"}
"EOF
" -------------------- telescope  ---------------------------- 
" **************************************************************
" **************************************************************
" ******************** source file *****************************
"
source $HOME/.config/nvim/plug-config/coc.vim
"source $HOME/.config/nvim/themes/onedark.vim " one dark theme

" -------------------- pylint ----------------------------------------
"source ~/.config/nvim/lua/pyright.vim
" -------------------- pylint ----------------------------------------
" -------------------- shortcut ----------------------------------------
source ~/.config/nvim/lua/shortcut.vim
" -------------------- shortcut ----------------------------------------
" ******************** source file *****************************
" **************************************************************
" **************************************************************

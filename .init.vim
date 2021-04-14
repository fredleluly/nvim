" -------------------- comment --------------------------------
" clipboard use "+y
" easymotion <leader><leader>w "good to know
"
" <C-o> and <C-i> or <C-^>useful for go and back to definition 
"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
" -------------------- comment ---------------------------------
" -------------------- required --------------------------------
" required
" pylint
" pyright
" pyls
" coc
" deoplete
" npm pyright
" -------------------- required --------------------------------

" -------------------- defalt  ---------------------------------
" source ~/.config/nvim/lua/init.lua

" -------------------- autocomplete ----------------------------

" compe
" coc 
" pyright
" pyls
" black if you need format
" davidhalter jedi
" ttserver
" clangd

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
" -------------------- defalt  ----------------------------

call plug#begin('~/.config/nvim/plugged')
" -------------------- Themes
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
"Plug 'vim-airline/vim-airline'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/edge'
"Plug 'bling/vim-airline'
"Plug 'akinsho/nvim-bufferline.lua'
" -------------------- Function
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'kien/ctrlp.vim'                " super searching ctrl p
Plug 'mhinz/vim-startify'
" -------------------- sweet functions
Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'
"Plug 'KKPMW/vim-sendtowindow'        " send commands to REPL

" -------------------- completion
"Plug 'davidhalter/jedi-vim'
" same as 174 line

" -------------------- linting

" -------------------- Server

" coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
" ini aja yang di aktifin
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" default lsp from nvim
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'hrsh7th/nvim-compe'
" if you want to active in line 174
"Plug 'prabirshrestha/vim-lsp'
"Plug 'Shougo/deoplete.nvim'
"Plug 'lighttiger2505/deoplete-vim-lsp'

" -------------------- Server

call plug#end()
" -------------------- config ----------------------------
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')

" -------------------- linting ---------------------------

" -------------------- setting plugin ----------------------------
" coc plugin in https://www.chrisatmachine.com/Neovim/04-vim-coc/
source ~/.config/nvim/plugin/color.vim

if has(("termguicolors"))
    set termguicolors
endif 
lua require 'colorizer'.setup()

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" -------------------- window ----------------------------
source ~/.config/nvim/plugin/windows.vim

" -------------------- useful shortcut ----------------------------
source ~/.config/nvim/plugin/shortcut.vim

" -------------------- telescope  ---------------------------- 
source $HOME/.config/nvim/plugin/telescope.vim
  "Using lua functions
 "nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
 "nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
 "nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
 "nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>"

" **************************************************************
" ******************** source file *****************************
source ~/.config/nvim/plugin/sets.vim
"luafile ~/.config/nvim/lua/statusline/lua.lua
"source $HOME/.config/nvim/plugin/.coc.vim
" -------------------- pylint ----------------------------------------
"source ~/.config/nvim/lsp/pyright.vim
" -------------------- pylint ----------------------------------------
" crazy 
" ~~~~~~~~~~~~~~~~~~~~~ compe completion ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"luafile ~/.config/nvim/lua/lsp/compe-config.lua
"source ~/.config/nvim/lua/lsp/nvim-compe.vim
" ~~~~~~~~~~~~~~~~~~~~~ compe completion ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"luafile ~/.config/nvim/lua/lsp/python-lsp.lua
"luafile ~/.config/nvim/lua/lsp/tsserver-lsp.lua
lua require'lspconfig'.clangd.setup{}
"lua require'lspconfig'.html.setup{}
" crazy 
"lua << EOF
"require'lspconfig'.html.setup {
    "filetypes = {"html"},
  "capabilities = capabilities,
"}
"EOF

" ******************** source file *****************************
" **************************************************************



"let g:node_host_prog = '/usr/local/bin/neovim-node-host'

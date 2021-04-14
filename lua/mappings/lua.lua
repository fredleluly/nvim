local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- copy any selected text with pressing y
map("", "<leader>c", '"+y')

-- OPEN TERMINALS --
map("n", "<C-l>", [[<Cmd>vnew term://bash <CR>]], opt) -- open term over right
map("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], opt) -- open term bottom

-- COPY EVERYTHING --
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)
-- endrik configuration --
vim.cmd([[autocmd Filetype javascript nnoremap <F5> :w <cr>:exec '!node %' <cr>]])
vim.cmd([[autocmd Filetype js nnoremap <F5> :w <cr>:exec '!node %' <cr>]])

--vim.cmd([[]])
--vim.cmd([[map <C-h> <C-w>h]])
--vim.cmd([[map <C-j> <C-w>j]])
--vim.cmd([[map <C-k> <C-w>k]])
--vim.cmd([[map <C-l> <C-w>l]])

--vim.cmd([[map <leader>th <C-w>t<C-w>H]])
--vim.cmd([[map <leader>tk <C-w>t<C-w>K]])
--vim.cmd([[source ~/.config/nvim/plugin/shortcut.vim]])
vim.cmd([[source ~/.config/nvim/plugin/sets.vim]])
vim.cmd([[nmap <C-_> <Plug>NERDCommenterToggle]])
vim.cmd([[vmap <C-_> <Plug>NERDCommenterToggle<CR>gv]])


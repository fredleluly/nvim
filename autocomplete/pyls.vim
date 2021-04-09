" -------------------- turn of /on pyls autocomplete---------------------------- 
autocmd BufEnter * lua require'completion'.on_attach()
lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
" -------------------- turn of / on pyls auto complete  ---------------------------- 
"
"or 
"
" -------------------- config vim lsp----------------------------
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

" -------------------- config vim lsp ----------------------------


" -------------------- telescope  ---------------------------- 
"telescope
 "Find files using Telescope command-line sugar.
 "nnoremap <leader>ff <cmd>Telescope find_files<cr>
 "nnoremap <leader>fg <cmd>Telescope live_grep<cr>
 "nnoremap <leader>fb <cmd>Telescope buffers<cr>
 "nnoremap <leader>fh <cmd>Telescope help_tags<cr>

 " Using lua functions
 nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
 nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
 nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
 nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>"
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom", 
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {},
    file_ignore_patterns = {},
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
  }
}
EOF
" -------------------- telescope  ---------------------------- 


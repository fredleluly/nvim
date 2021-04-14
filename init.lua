local cmd = vim.cmd
local g = vim.g

cmd "source ~/.config/nvim/.init.vim"
require "bufferline.lua"
--require "statusline.lua"
require "pluginsList.lua"
require("colorizer").setup()
require "nvimTree.lua"
require "gitsigns.lua"

g.mapleader = " "
g.auto_save = 1

--require("lspkind").init(
    --{
        --with_text = true,
        --symbol_map = {
            --Folder = ""
        --}
    --}
--)

--g.indentLine_enabled = 1
--g.indent_blankline_char = "▏"

--require "lsp_config.lua"
cmd "syntax enable"
cmd "syntax on"
--vim.o.updatetime = 300 -- Faster completion
--vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms

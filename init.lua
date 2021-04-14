local cmd = vim.cmd
local g = vim.g

cmd "source ~/.config/nvim/.init.vim"
require "bufferline.lua"
require "statusline.lua"
require "pluginsList.lua"
require("colorizer").setup()
require "nvimTree.lua"
require "gitsigns.lua"
require("mappings.lua")
require("treesitter.lua")
-- completion
require("lspSave.lua")
--require("lsp_config.lua")
--require('lang')

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

cmd "syntax enable"
cmd "syntax on"
--vim.o.updatetime = 300 -- Faster completion
--vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
cmd "set updatetime=50"
cmd "set mouse=a"


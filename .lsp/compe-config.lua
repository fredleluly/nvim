vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--require('compe').setup({
  --enabled = true;
  --autocomplete = true;
  --debug = false;
  --min_length = 1;
  --preselect = 'enable';
  --throttle_time = 80;
  --source_timeout = 200;
  --incomplete_delay = 400;
  --max_abbr_width = 100;
  --max_kind_width = 100;
  --max_menu_width = 100;
  --documentation = true;
  --source = {
    --path = true;
    --buffer = true;
    --calc = true;
    --vsnip = false;
    --nvim_lsp = true;
    --nvim_lua = true;
    --spell = true;
    --tags = true;
    --snippets_nvim = false;
    --treesitter = true;
  --};
--})

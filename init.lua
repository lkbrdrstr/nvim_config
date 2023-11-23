require "config.options"
require "config.autocmds"
require "config.keymaps"
require "config.lazy"

vim.cmd [[
" Use Tab to expand and jump through snippets
imap <silent><expr> jk luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : 'jk'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'

" Use Shift-Tab to jump backwards through snippets
smap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : 'kj'
smap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : 'kj'
]]

require "luasnip.loaders.from_lua".load { paths = "~/.config/nvim/LuaSnip" }
require "luasnip".config.set_config {
  update_events = { "TextChanged", "TextChangedI" },
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
}

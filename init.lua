require "config.options"
require "config.autocmds"
require "config.keymaps"
require "config.lazy"

vim.cmd [[
imap <silent><expr> jk luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : 'jk'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
]]

require "luasnip.loaders.from_lua".load { paths = "~/.config/nvim/LuaSnip" }
require "luasnip".config.set_config {
  update_events = { "TextChanged", "TextChangedI" },
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
}

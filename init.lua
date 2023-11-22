require "config.options"
require "config.autocmds"
require "config.keymaps"
require "config.lazy"

vim.cmd [[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<Tab>'
]]

require "luasnip.loaders.from_lua".load { paths = "~/.config/nvim/LuaSnip" }
require "luasnip".config.set_config {
  update_events = { "TextChanged", "TextChangedI" },
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
}

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.typ", "*.typst", "*.lua" }, command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2" }
)

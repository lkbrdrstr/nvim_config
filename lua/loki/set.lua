vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    { command = "lua vim.lsp.buf.format()" }
)

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.cc", "*.hh" },
        command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2"
    }
)

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.typ", "*.typst", "*.lua" }, command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2" }
)

--[[
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.tex" }, command = "setlocal filetype=latex" }
)
--]]

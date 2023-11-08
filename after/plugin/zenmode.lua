vim.keymap.set("n", "<leader>zz", function()
  require "zen-mode".setup {
    window = {
      width = 90,
      options = {},
    },
  }
  require "zen-mode".toggle()
  vim.wo.wrap = true
  vim.wo.number = true
  vim.wo.rnu = true
  vim.cmd "colorscheme catppuccin"
end)

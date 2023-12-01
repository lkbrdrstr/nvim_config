return {
  "numToStr/FTerm.nvim",
  init = function()
    require "FTerm".setup {
      cmd = "~/.cargo/bin/nu"
    }
    vim.keymap.set("n", "<leader>b", function() require "FTerm".toggle() end)
  end,
}

return {
  "gelguy/wilder.nvim",
  init = function()
    require "wilder".setup {
      modes = { ":", "/", "?" }
    }
  end,
  opts = {},
}

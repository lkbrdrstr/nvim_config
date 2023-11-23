return {
  "LhKipp/nvim-nu",
  init = function()
    require "nu".setup {
      use_lsp_features = false,
    }
  end,
}

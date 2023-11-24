return {
  "numToStr/FTerm.nvim",
  init = function()
    require "FTerm".setup {
      cmd = "/Users/loki/.cargo/bin/nu --env-config ~/.config/nushell/env.nu --config ~/.config/nushell/config.nu"
    }
    vim.keymap.set("n", "<leader>b", function() require "FTerm".toggle() end)
  end,
}

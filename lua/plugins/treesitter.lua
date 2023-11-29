return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "csv",
        "dockerfile",
        "fish",
        "go",
        "haskell",
        "latex",
        "lua",
        "make",
        "markdown",
        "rust",
        "swift",
        "toml",
        "vim",
        "vimdoc",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
    }
  end,
}

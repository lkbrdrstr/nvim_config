return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require "nvim-treesitter.configs"

        configs.setup {
            ensure_installed = {},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = { enable = true },
            indent = { enable = true },
        }
    end,
}

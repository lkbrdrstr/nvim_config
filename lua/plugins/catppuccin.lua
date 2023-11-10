return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function()
        require "catppuccin".setup {
            flavor = "mocha",
            transparent_background = true
        }
        vim.cmd.colorscheme "catppuccin"
    end
}

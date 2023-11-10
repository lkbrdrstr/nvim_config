return {
    "folke/zen-mode.nvim",
    init = function()
        vim.keymap.set("n", "<leader>zz", function()
            local zen = require "zen-mode"

            zen.setup {
                window = {
                    width = 90,
                    options = {},
                },
            }
            zen.toggle()
            vim.wo.wrap = true
            vim.wo.number = true
            vim.wo.relativenumber = true
            vim.cmd.colorscheme "catppuccin"
        end)
    end,
}

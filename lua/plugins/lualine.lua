return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    init = function()
        local lualine = require "lualine"

        local colors = {
            bg       = "#202328",
            fg       = "#bbc2cf",
            yellow   = "#ecbe7b",
            cyan     = "#008080",
            darkblue = "#081633",
            green    = "#98be65",
            orange   = "#ff8800",
            violet   = "#a9a1e1",
            magenta  = "#c678dd",
            blue     = "#51afef",
            red      = "#ec5f67",
        }

        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            V = colors.blue,
            [""] = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand "%:p:h"
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        local config = {
            options = {
                component_separators = "",
                section_separators = "",
                theme = "catppuccin-mocha",
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left {
            function()
                return "▊"
            end,
            color = function()
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 0, right = 1 }, -- We don"t need space before this
        }

        ins_left {
            -- mode component
            function()
                local modes = {
                    n = "NOR",
                    v = "VIS",
                    V = "VIS",
                    [""] = "VIS",
                    i = "INS",
                    c = "CMD",
                }
                return modes[vim.fn.mode()]
            end,
            color = function()
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { right = 1 },
        }

        ins_left {
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = "bold" },
        }

        ins_left { "location" }

        ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

        ins_left {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
            },
        }

        ins_right {
            "branch",
            icon = "",
            color = { fg = colors.violet, gui = "bold" },
        }

        ins_right {
            "diff",
            symbols = { added = " ", modified = "󰝤 ", removed = " " },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }

        ins_right {
            function()
                return "▊"
            end,
            color = function()
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 1 },
        }

        lualine.setup(config)
    end,
}

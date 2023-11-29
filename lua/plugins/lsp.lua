return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
      local lsp_zero = require "lsp-zero"
      lsp_zero.extend_cmp()

      local cmp = require "cmp"
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup {
        sources = {
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert {
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<CR>"] = cmp.mapping.confirm { select = false },
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        snippet = {
          expand = function(args)
            require "luasnip".lsp_expand(args.body)
          end,
        }
      }
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lsp_zero = require "lsp-zero"
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "H", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "L", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end)

      require "mason-lspconfig".setup {
        ensure_installed = {
          "clangd",
          "gopls",
          -- "latexindent",
          "lua_ls",
          "marksman",
          "rust_analyzer",
          "taplo",
          "texlab",
          "typst_lsp",
          "vimls",
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require "lspconfig".lua_ls.setup(lua_opts)
          end,
          texlab = function()
            require "lspconfig".texlab.setup {
              executable = "tectonic",
              args = { "-X", "compile", "%", "--synctex", "--keep-logs", "--keep-intermediates" }
            }
          end,
          rust_analyzer = function()
            require "lspconfig".rust_analyzer.setup {
              settings = {
                ["rust-analyzer"] = {
                  checkOnSave = {
                    enable = true,
                    command = "clippy",
                  }
                }
              }
            }
          end,
        }
      }
    end
  }
}

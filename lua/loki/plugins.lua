local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "couldn't find packer :("
  return
end

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    "windwp/nvim-autopairs",
    config = function() require "nvim-autopairs".setup {} end,
  }

  use {
    'akinsho/bufferline.nvim', tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require "bufferline".setup {}
    end
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use "ThePrimeagen/harpoon"

  use "nvim-lualine/lualine.nvim"

  use {
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require "nvim-surround".setup {}
    end
  }

  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
  }

  use {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    requires = 'nvim-lua/plenary.nvim'
  }

  use "folke/zen-mode.nvim"

  use "eandrju/cellular-automaton.nvim"

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  if packer_bootstrap then
    packer.sync()
  end
end)

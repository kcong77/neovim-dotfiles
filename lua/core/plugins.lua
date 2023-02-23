-- Automatically install packer at first launch
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever the plugins.lua file save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Safe call packer so we don't get error on first clone
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

-- Set packer to use popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install plugins
return packer.startup(function(use)
  -- Packer manage itself and dependencies
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "nvim-lua/popup.nvim" })
  -- Icons
  use({ "kyazdani42/nvim-web-devicons" })

  -- LSP
  use({ "neovim/nvim-lspconfig" })
  use({ "williamboman/mason.nvim" })
  use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })
  -- Auto complete
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  -- Snippet
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "L3MON4D3/LuaSnip" })
  use({ "rafamadriz/friendly-snippets" })
  -- Format
  use({ "jose-elias-alvarez/null-ls.nvim" })
  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })
  -- Auto close bracket
  use({ "windwp/nvim-autopairs" })
  -- Dashboard
  use({ "goolord/alpha-nvim" })
  -- Comment
  use({ "numToStr/Comment.nvim" })
  -- Theme
  use({ "folke/tokyonight.nvim" })
  -- Syntax highlighting
  use({ "nvim-treesitter/nvim-treesitter", require = "windwp/nvim-ts-autotag" })
  -- Speedup startup time
  use({ "lewis6991/impatient.nvim" })
  -- Git change
  use({ "lewis6991/gitsigns.nvim" })
  -- File Explorer
  use({ "kyazdani42/nvim-tree.lua", commit = "5b554a9e2d910407a8822a321cb909d0babb1c2f" })
  -- Status bar
  use({ "nvim-lualine/lualine.nvim" })
  -- Keymaps
  use({ "folke/which-key.nvim" })
  -- Close tab
  use({ "ojroques/nvim-bufdel" })
  -- Tab
  use({ "akinsho/bufferline.nvim" })
  -- Color
  use({ "norcalli/nvim-colorizer.lua" })
  -- Blankline
  use({ "lukas-reineke/indent-blankline.nvim" })

  -- Automatically set up after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)

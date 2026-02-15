-- 1. Tự động cài đặt Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Cấu hình Plugin
require("lazy").setup({
  -- Theme Catppuccin
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },

  -- Colorizer ---
  {
	  "norcalli/nvim-colorizer.lua",
	  config = function()
		  require("colorizer").setup()
	end
},

  -- Status Line (Lualine)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
      })
    end
  },
})

-- 3. Cấu hình chung
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true


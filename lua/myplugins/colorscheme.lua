return {
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    opts = { transparent = true }
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = { transparent = true }
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
    opts = { style = 'darker', transparent = true }
  },
  {
    'sainnhe/gruvbox-material',
    lazy = true,
    config = function ()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_foreground = 'mix'
    end
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
    opts = { transparent_background = true }
  },
}

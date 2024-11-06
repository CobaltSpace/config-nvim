return {
  {
    'echasnovski/mini.tabline',
    enabled = false,
    event = 'VeryLazy',
    config = true
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    -- enabled = false,
    event = 'VeryLazy',
    config = true
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    enabled = false,
    event = 'VeryLazy',
    opts = {
      auto_hide = true
    }
  }
}

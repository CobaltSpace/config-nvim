return {
  {
    'echasnovski/mini.tabline',
    enabled = false,
    event = { 'BufAdd', 'BufLeave' },
    config = true
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    enabled = false,
    event = { 'BufAdd', 'BufLeave' },
    config = true
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    -- enabled = false,
    event = { 'BufAdd', 'BufLeave' },
    opts = {
      auto_hide = true
    }
  }
}

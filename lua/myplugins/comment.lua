return {
  {
    'numToStr/Comment.nvim',
    enabled = false,
    config  = true,
    keys    = {
      { 'gc', mode = { 'n', 'v' } },
      { 'gb', mode = { 'n', 'v' } },
    }
  },
  {
    'echasnovski/mini.comment',
    -- enabled = false,
    main   = 'mini.comment',
    config = true,
    keys   = {
      { 'gc', mode = { 'n', 'v' } },
    }
  }
}

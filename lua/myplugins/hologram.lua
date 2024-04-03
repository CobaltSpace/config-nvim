return {
  'edluffy/hologram.nvim',
  opts = { auto_display = true },
  cond = function ()
    return not vim.g.neovide
  end
}

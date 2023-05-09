return {
  'nvim-treesitter/nvim-treesitter',
  build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  opts = {
    -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
    auto_install = true,
    highlight = {
      enable = true,
      disable = function(lang, bufnr)
        return lang == 'vim' and vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] == 'vim9script'
      end,
      additional_vim_regex_highlighting = { 'org' }, -- Required since TS highlighter doesn't support all syntax features (conceal)
      -- additional_vim_regex_highlighting = true,
    },
  },
  config = function (_, opts)
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    require('orgmode').setup_ts_grammar()
    require('nvim-treesitter.configs').setup(opts)
  end
}

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- yadm = { enable = true },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end)

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end)

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git stage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git reset hunk' })
      map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
        { desc = 'git stage hunk' })
      map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
        { desc = 'git reset hunk' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git stage buffer' })
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git undo stage hunk' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git reset buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git preview hunk' })
      map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'git blame line' })
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'git toggle current line blame' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git diffthis' })
      map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = 'git diffthis ~' })
      map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'git toggle deleted' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'git select hunk' })
    end
  }
}

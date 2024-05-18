return {
  'nvim-orgmode/orgmode',
  dependencies = 'akinsho/org-bullets.nvim',
  ft = 'org',
  opts = {
    org_agenda_files = { '~/Documents/Org/*' },
    org_default_notes_file = '~/Documents/Org/notes.org',
    org_startup_indented = true,
  }
}

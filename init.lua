--  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
--  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
--  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
--  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
--  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
--  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

-- vim.opt.runtimepath:prepend(vim.fn.stdpath('config') .. '/../bothvim')
-- vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/../bothvim/after')
-- vim.opt.runtimepath:prepend(vim.fn.stdpath('data') .. '/../bothvim/site')
-- vim.opt.runtimepath:append(vim.fn.stdpath('data') .. '/../bothvim/site/after')

-- vim.opt.packpath = vim.opt.runtimepath:get()

vim.o.termguicolors = true

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require('lazy').setup 'myplugins'

if vim.g.neovide then
  vim.g.neovide_transparency    = 0.7
  vim.g.neovide_cursor_vfx_mode = 'railgun'

  vim.g.gui_font_default_size   = 12
  vim.g.gui_font_size           = vim.g.gui_font_default_size
  vim.g.gui_font_face           = 'FantasqueSansM Nerd Font'

  RefreshGuiFont                = function()
    vim.opt.guifont = string.format('%s:h%s', vim.g.gui_font_face, vim.g.gui_font_size)
  end

  ResizeGuiFont                 = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
  end

  ResetGuiFont                  = function()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
  end

  -- Call function on startup to set default value
  ResetGuiFont()

  -- Keymaps

  local opts = { noremap = true, silent = true }

  vim.keymap.set({ 'n', 'i' }, "<C-=>", function() ResizeGuiFont(1) end, opts)
  vim.keymap.set({ 'n', 'i' }, "<C-->", function() ResizeGuiFont(-1) end, opts)
  vim.keymap.set({ 'n', 'i' }, "<C-0>", function() ResetGuiFont() end, opts)
end

-- vim.cmd.source(vim.fn.stdpath('config') .. '/both.vim')

vim.opt.autochdir     = true
vim.opt.autoread      = true
vim.opt.scrolloff     = 1
vim.opt.sidescrolloff = 5
vim.opt.title         = true

vim.api.nvim_create_autocmd('BufReadPost', {
  command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]
})

vim.opt.mouse          = 'a'
vim.opt.undofile       = true
vim.opt.conceallevel   = 2
vim.opt.concealcursor  = 'n'
vim.g.vimsyn_embed   = 'lmpPrt'
vim.opt.spell          = true
vim.opt.spelllang    = { 'en', 'cjk' }
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.numberwidth    = 1
vim.cmd.filetype 'indent on'
vim.opt.expandtab   = true
vim.opt.list        = true
vim.opt.lcs       = { tab = '▏ ' }
-- vim.g.c_syntax_for_h = 1

vim.filetype.add {
  extension = {
    ffpreset   = 'conf',
    avpreset   = 'conf',
    hook       = 'conf',
    rasi       = 'rasi',
    i3config   = 'i3config',
    mcmeta     = 'json',
    swayconfig = 'swayconfig',
  },
  pattern = {
    ['.*/hypr/.*%.conf']   = 'hyprlang',
    ['/var/tmp/*.service'] = 'systemd',
    ['/var/tmp/*.timer']   = 'systemd',
  },
}

vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.conceallevel = 0
    vim.cmd.startinsert()
  end
})

-- vim.g.vimtex_compiler_program = 'nvr' -- nvr for vimtex
-- vim.fn.setenv("EDITOR", "nvr")

-- vim.g.UltiSnipsUsePythonVersion = 3

vim.opt.guicursor:append 'a:blinkwait1-blinkon530-blinkoff530'

-- local myColorSchemes = {
--   'kanagawa',
--   'tokyonight',
--   'onedark',
--   'gruvbox-material',
--   'catppuccin',
-- }
--
-- vim.cmd.colorscheme(myColorSchemes[math.random(#myColorSchemes)])
vim.cmd.colorscheme 'catppuccin'

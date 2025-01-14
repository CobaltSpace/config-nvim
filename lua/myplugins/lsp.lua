local function capabilities()
  return require('cmp_nvim_lsp').default_capabilities()
end

local function generate_default_setup()
  return {
    capabilities = capabilities()
  }
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'j-hui/fidget.nvim', tag = "legacy", config = true },
    ft = { 'arduino', 'awk', 'sh', 'cmake', 'css', 'haskell', 'html', 'javascript', 'javascriptreact', 'lhaskell', 'markdown', 'nix', 'python', 'sql', 'tex', 'typescript', 'vim' },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'declaration', buffer = ev.buf })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'definition', buffer = ev.buf })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'implementation', buffer = ev.buf })
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,
            { desc = 'add workspace folder', buffer = ev.buf })
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
            { desc = 'remove workspace folder', buffer = ev.buf })
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { desc = 'list workspace folders', buffer = ev.buf })
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc = 'type definition', buffer = ev.buf })
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { desc = 'rename', buffer = ev.buf })
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc = 'code action', buffer = ev.buf })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'references', buffer = ev.buf })
        end,
      })

      local lspconfig = require 'lspconfig'

      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {
        desc = 'open diagnostic float',
        noremap = true,
        silent = true,
      })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
        desc = 'previous diagnostic',
        noremap = true,
        silent = true,
      })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
        desc = 'previous diagnostic',
        noremap = true,
        silent = true,
      })
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {
        desc = 'set diagnostic loclist',
        noremap = true,
        silent = true,
      })

      local default_setup = generate_default_setup()

      lspconfig.arduino_language_server.setup(default_setup)
      lspconfig.awk_ls.setup(default_setup)
      lspconfig.bashls.setup(default_setup)
      lspconfig.cmake.setup(default_setup)
      lspconfig.cssls.setup(default_setup)
      -- lspconfig.eslint.setup(default_setup)
      lspconfig.hls.setup(default_setup)
      lspconfig.html.setup(default_setup)
      require('lspconfig').lua_ls.setup {
        capabilities = capabilities(),
        settings = { Lua = { telemetry = { enable = false } } }
      }
      lspconfig.marksman.setup(default_setup)
      -- lspconfig.nil_ls.setup(default_setup)
      lspconfig.nixd.setup {
        capabilities = capabilities(),
        settings = {
          nixd = {
            options = {
              home_manager = {
                expr = '(import <home-manager/modules> { configuration = ~/.config/home-manager/home.nix; pkgs = import <nixpkgs> {}; }).options'
              }
            }
          }
        }
      }
      lspconfig.postgres_lsp.setup(default_setup)
      lspconfig.pylsp.setup(default_setup)
      lspconfig.ruff.setup(default_setup)
      -- lspconfig.stylelint_lsp.setup(default_setup)
      lspconfig.texlab.setup(default_setup)
      lspconfig.ts_ls.setup {
        ---@diagnostic disable-next-line: unused-local
        on_attach = function(client, bufnr)
          -- local ns = vim.lsp.diagnostic.get_namespace(client.id)
          -- vim.diagnostic.enable(false, { ns_id = ns })
        end,
        capabilities = capabilities(),
      }
      lspconfig.vimls.setup(default_setup)
    end
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'rcarriga/nvim-dap-ui',
      'nvim-lua/plenary.nvim'
    },
    ft = 'rust',
    event = 'BufEnter Cargo.toml',
    opts = function()
      local rt = require 'rust-tools'
      return {
        server = {
          settings = {
            ['rust-analyzer'] = {
              inlayHints = { locationLinks = false },
              checkOnSave = { command = 'clippy' },
            },
          },
          on_attach = function(client, bufnr)
            -- Hover actions
            vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { desc = 'hover actions', buffer = bufnr })
            -- Code action groups
            vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group,
              { desc = 'code action group', buffer = bufnr })
          end,
          capabilities = capabilities()
        }
      }
    end
  },
  {
    'https://git.sr.ht/~p00f/clangd_extensions.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    ft = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    config = function()
      local inlay_hints = require 'clangd_extensions.inlay_hints'
      inlay_hints.setup_autocmd()
      inlay_hints.set_inlay_hints()
      require('lspconfig').clangd.setup(generate_default_setup())
    end
  },
  -- {
  --   'folke/neodev.nvim',
  --   dependencies = 'neovim/nvim-lspconfig',
  --   ft = 'lua',
  --   event = 'BufRead .luarc.json',
  --   config = function()
  --     require('neodev').setup()
  --
  --     require('lspconfig').lua_ls.setup {
  --       capabilities = capabilities(),
  --       settings = { Lua = { telemetry = { enable = false } } }
  --     }
  --   end
  -- },
  {
    'b0o/schemastore.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    ft = { 'json', 'jsonc', 'yaml', 'yaml.docker-compose' },
    config = function()
      local lspconfig = require 'lspconfig'

      lspconfig.jsonls.setup {
        cmd = { 'vscode-json-languageserver', '--stdio' },
        settings = { json = { schemas = require('schemastore').json.schemas(), validate = { enable = true } } },
        capabilities = capabilities()
      }

      lspconfig.yamlls.setup {
        settings = { yaml = { schemas = require('schemastore').yaml.schemas() } },
        capabilities = capabilities()
      }
    end
  },
  -- {
  --   'mrcjkb/haskell-tools.nvim',
  --   dependencies = 'neovim/nvim-lspconfig',
  --   version = '^3', -- Recommended
  --   ft = { 'haskell', 'lhaskell' }
  -- }
}

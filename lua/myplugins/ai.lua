return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
        },
        -- adapters = {
        --   deepseekCoderV2 = function()
        --     return require('codecompanion.adapters').extend('ollama', {
        --       name = 'deepseekCoderV2', -- Give this adapter a different name to differentiate it from the default ollama adapter
        --       schema = {
        --         model = {
        --           default = 'deepseek-coder-v2:16b-lite-instruct-q5_K_M',
        --         },
        --         num_ctx = {
        --           default = 16384,
        --         },
        --         num_predict = {
        --           default = -1,
        --         },
        --       },
        --     })
        --   end,
        -- }
      },
    },
  },
}

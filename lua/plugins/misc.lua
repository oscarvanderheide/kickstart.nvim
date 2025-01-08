return {

  -- Auto-session: Remember the state of your neovim session
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },

  -- Inc-Rename: Rename a variable and all its references incrementally
  { 'smjonas/inc-rename.nvim', event = 'VeryLazy', opts = {} },

  -- Autopairs: automatically adds closing ),] or } (disabled because it annoyed me)
  {
    -- 'windwp/nvim-autopairs',
    -- event = 'InsertEnter',
    -- -- Optional dependency
    -- dependencies = { 'hrsh7th/nvim-cmp' },
    -- config = function()
    --   require('nvim-autopairs').setup {}
    --   -- If you want to automatically add `(` after selecting a function or method
    --   local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    --   local cmp = require 'cmp'
    --   cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    -- end,
  },

  -- TreeSJ: Split/join blocks of code.
  {
    'Wansmer/treesj',
    dependencies = 'nvim-treesitter',
    keys = { { '<leader>j', '<cmd>TSJToggle<cr>', desc = '[J]oin/split code block' } },
    opts = { use_default_keymaps = false },
  },

  -- Tree-pairs: Jump using % to the other end of a treesitter node
  {
    'yorickpeterse/nvim-tree-pairs',
    event = 'VeryLazy',
    opts = {},
  },

  -- Neogen: Automatically add docstrings to your functions
  -- {
  --   'danymat/neogen',
  --   config = true,
  --   -- Uncomment next line if you want to follow only stable versions
  --   -- version = "*",
  --   keys = {
  --     { '<Leader>nf', ":lua require('neogen').generate()<CR>" },
  --   },
  -- },

  -- Sleuth: Automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
  {
    -- Automatically set tabstops and indents
    'tpope/vim-sleuth',
  },
  {
    -- Better-escape: escape from insert mode something like jj without the usual delay
    'max397574/better-escape.nvim',
    opts = {
      default_mappings = false,
      mappings = {
        -- n = {
        --   -- Use kj to enter Julia block movement mode
        --   k = { j = 'kj' },
        -- },
        i = { -- Keymaps to exit insert mode
          j = { j = '<Esc>' },
        },
        c = { -- Keymaps to exit command mode
          j = {
            k = '<Esc>',
          },
        },
        t = { -- Keymaps to exit terminal mode
          j = {
            j = '<C-\\><C-n>',
          },
        },
        v = { -- Keymaps to exit visual mode
          j = {
            k = '<Esc>',
          },
        },
        s = { -- Keymaps to enter selection mode
          j = {
            k = '<Esc>',
          },
        },
      },
    },
  },
}

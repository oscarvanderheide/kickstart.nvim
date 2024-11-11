-- lua with lazy.nvim
return {
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
          k = '<C-\\><C-n>',
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
}

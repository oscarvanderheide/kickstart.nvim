-- lua with lazy.nvim
return {
  'max397574/better-escape.nvim',
  opts = {
    default_mappings = false,
    mappings = {
      i = {
        j = {
          -- These can all also be functions
          k = '<Esc>',
          j = '<Esc>',
        },
      },
      c = {
        j = {
          k = '<Esc>',
          j = '<Esc>',
        },
      },
      t = {
        j = {
          k = '<C-\\><C-n>',
        },
      },
      v = {
        j = {
          k = '<Esc>',
        },
      },
      s = {
        j = {
          k = '<Esc>',
        },
      },
    },
  },
}

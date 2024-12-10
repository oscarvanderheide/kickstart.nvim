-- toggleterm: quickly open and manage terminals
return {
  -- amongst your other plugins
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      -- A lot of stuff to get a floating terminal that can be toggled with <C-\>
      local Terminal = require('toggleterm.terminal').Terminal
      local floating_term = Terminal:new {
        direction = 'float',
        float_opts = {
          -- border = 'double',
          width = 120,
          height = 40,
        },
        -- function to run on opening the terminal
        on_open = function(term)
          -- Start in insert mode rather than normal mode
          vim.cmd 'startinsert!'
          -- Close terminal with q in normal mode (I actually prefer <C-\> to close)
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
      }

      function _floating_term_toggle()
        floating_term:toggle()
      end

      vim.api.nvim_set_keymap('n', '<C-\\>', '<cmd>lua _floating_term_toggle()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('t', '<C-\\>', '<cmd>lua _floating_term_toggle()<CR>', { noremap = true, silent = true })
    end,
  },
}

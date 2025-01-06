return {
  'aaronik/treewalker.nvim',
  opts = {
    highlight = false, -- default is false
  },
  config = function()
    local tw = require 'treewalker'

    vim.keymap.set('n', 'H', tw.move_out, { noremap = true })
    vim.keymap.set('n', 'L', tw.move_in, { noremap = true })
    vim.keymap.set('v', 'H', tw.move_out, { noremap = true })
    vim.keymap.set('v', 'L', tw.move_in, { noremap = true })
  end,
}

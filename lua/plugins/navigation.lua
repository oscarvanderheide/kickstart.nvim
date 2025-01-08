return {

  -- Flash: Jump labels for faster navigation and selection
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          -- Improved character navigation (e.g. `f`, `t`, `F`, `T`)
          enabled = true,
        },
      },
    },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },

  -- Treewalker: Move in and out of nodes and between neighbours
  {
    'aaronik/treewalker.nvim',
    opts = {
      highlight = false, -- default is false
    },
    keys = {
      { '<leader>wj', '<cmd>Treewalker Down<cr>', silent = true, desc = 'Down (Treewalker)' },
      { '<leader>wk', '<cmd>Treewalker Up<cr>', silent = true, desc = 'Up (Treewalker)' },
      { '<leader>wh', '<cmd>Treewalker Left<cr>', silent = true, desc = 'Left (Treewalker)' },
      { '<leader>wl', '<cmd>Treewalker Right<cr>', silent = true, desc = 'Right (Treewalker)' },
    },
  },

  -- Spider: Word movements that feel more natural to me (e.g. CamelCase is considered two words)
  {
    'chrisgrieser/nvim-spider',
    keys = {
      {
        'e',
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { 'n', 'o', 'x' },
      },
      {
        'w',
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { 'n', 'o', 'x' },
      },
      {
        'b',
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { 'n', 'o', 'x' },
      },
    },
  },
}

-- Quickly navigate within buffer using s
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        jump_labels = true, -- jump to labels starting with the typed character
      },
    },

    -- Smooth jumping using cinnamon
    action = function(match, state)
      local cinnamon = require 'cinnamon'
      local jump = require 'flash.jump'
      cinnamon.scroll(function()
        jump.jump(match, state)
        jump.on_jump(state)
      end)
    end,
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}

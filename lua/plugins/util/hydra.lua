return {
  'nvimtools/hydra.nvim',

  config = function()
    -- Basic example of a Hydra-like keymap setup using Lua in Neovim
    local Hydra = require 'hydra'

    -- Hydra {
    --   name = 'Julia block movement',
    --   mode = { 'n' },
    --   body = '<leader>j',
    --   config = {
    --     -- color = "pink",
    --   },
    --   heads = {
    --
    --     -- Move to start of next/previous Julia block
    --     { 'j', ':<C-U>let b:jlblk_count=v:count1 | call julia_blocks#moveblock_n()<CR>', { silent = true } },
    --     { 'k', ':<C-U>let b:jlblk_count=v:count1 | call julia_blocks#moveblock_p()<CR>', { silent = true } },
    --     -- Move to end of next/previous Julia block
    --     { 'J', ':<C-U>let b:jlblk_count=v:count1 | call julia_blocks#moveblock_N()<CR>', { silent = true } },
    --     { 'K', ':<C-U>let b:jlblk_count=v:count1 | call julia_blocks#moveblock_P()<CR>', { silent = true } },
    --     -- exit this Hydra
    --     { 'q', nil, { exit = true, nowait = true } },
    --     { ';', nil, { exit = true, nowait = true } },
    --     { '<Esc>', nil, { exit = true, nowait = true } },
    --   },
    -- }
    -- config = function()
    --   -- create hydras in here
    --   local Hydra = require 'hydra'
    --   Hydra {
    --     -- string? only used in auto-generated hint
    --     name = 'tJulia block movement',
    --
    --     -- string | string[] modes where the hydra exists, same as `vim.keymap.set()` accepts
    --     mode = 'n',
    --
    --     -- string? key required to activate the hydra, when excluded, you can use
    --     -- Hydra:activate()
    --     body = '<leader>nj',
    --
    --     -- these are explained below
    --     hint = [[ [j] Next code block [k] Previous code block ]],
    --     -- config = { ... },
    --     heads = {
    --       { 'j', ':<C-U>let b:jlblk_count=v:count1 | call julia_blocks#moveblock_n()<CR>', { desc = 'Move to next Julia block', silent = true } },
    --       { 'k', ':<C-U>let b:jlblk_count=v:count1 | call julia_blocks#moveblock_p()<CR>', { desc = 'Move to previous Julia block', silent = true } },
    --     },
    --   }
    -- end,
  end,
}

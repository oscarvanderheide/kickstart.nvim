-- notebook-navigator: quickly jump between and execute code cells
return {
  {
    'GCBallesteros/NotebookNavigator.nvim',
    keys = {
      {
        'M-S-j',
        function()
          require('notebook-navigator').move_cell 'd'
        end,
      },
      --   {
      --     'A-k',
      --     function()
      --       require('notebook-navigator').move_cell 'u'
      --     end,
      --   },
      { '<leader>X', "<cmd>lua require('notebook-navigator').run_cell()<cr>", { desc = 'Run Cell' } },
      { '<leader>x', "<cmd>lua require('notebook-navigator').run_and_move()<cr>", { desc = 'Run Cell and Move' } },
    },
    dependencies = {
      'echasnovski/mini.comment',

      -- 'benlubas/molten-nvim',
      'hkupty/iron.nvim', -- REPL provider
      -- 'akinsho/toggleterm.nvim',
      'anuvyklack/hydra.nvim',
    },
    event = 'VeryLazy',

    config = function()
      local nn = require 'notebook-navigator'
      nn.setup {
        activate_hydra_keys = '<leader>h',
        cell_markers = {
          julia = '##', -- Set the code cell marker for Julia
          python = '##',
        },
        repl_provider = 'iron',
        syntax_highlight = true,
        -- (Optional) for use with `mini.hipatterns` to highlight cell markers
        cell_highlight_group = 'Folded',
      }
    end,
  },
  {
    -- Enable things like vih to select code cells
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    dependencies = { 'GCBallesteros/NotebookNavigator.nvim' },
    opts = function()
      local nn = require 'notebook-navigator'
      local opts = { custom_textobjects = { h = nn.miniai_spec } }
      return opts
    end,
  },
}

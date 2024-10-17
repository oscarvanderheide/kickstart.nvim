return {
  {
    'GCBallesteros/NotebookNavigator.nvim',
    keys = {
      {
        ']h',
        function()
          require('notebook-navigator').move_cell 'd'
        end,
      },
      {
        '[h',
        function()
          require('notebook-navigator').move_cell 'u'
        end,
      },
      { '<leader>X', "<cmd>lua require('notebook-navigator').run_cell()<cr>", { desc = 'Run Cell' } },
      { '<leader>x', "<cmd>lua require('notebook-navigator').run_and_move()<cr>", { desc = 'Run Cell and Move' } },
    },
    dependencies = {
      'echasnovski/mini.comment',
      -- 'hkupty/iron.nvim', -- REPL provider
      'akinsho/toggleterm.nvim',
      'anuvyklack/hydra.nvim',
    },
    event = 'VeryLazy',
    config = function()
      local nn = require 'notebook-navigator'
      nn.setup {
        activate_hydra_keys = '<leader>h',
        cell_markers = {
          julia = '##', -- Set the code cell marker for Julia
        },
      }
      local tt = require 'toggleterm'
      tt.setup {
        -- Open terminal in vertical split
        direction = 'vertical',
        -- Set size of split
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.5
          end
        end,
        -- No shading
        shade_terminals = false,
        -- Automatically start REPL based on filetype
        on_open = function(term)
          term:send('julia', true)
          -- local filetype = vim.bo.filetype
          -- if filetype == 'python' then
          --   -- Send the command to open IPython
          --   vim.api.nvim_chan_send(term.job_id, 'ipython\n')
          -- elseif filetype == 'julia' then
          --   -- Send the command to open Julia REPL
          --   vim.api.nvim_chan_send(term.job_id, 'julia\n')
          -- end
        end,
      }
      -- Configure iron.nvim for vertical REPL
      -- local iron = require 'iron.core'
      -- iron.setup {
      --   config = {
      --     scratch_repl = true,
      --     repl_open_cmd = require('iron.view').right(0.5), -- Use vertical split with 40 columns
      --     repl_definition = {
      --       julia = {
      --         command = { 'julia' }, -- Command to start the Julia REPL
      --       },
      --       -- Add other language definitions if needed
      --     },
      --   },
      -- }
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

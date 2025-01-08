return {

  -- Iron: Interactive Repl (I kinda like the + operator)
  'Vigemus/iron.nvim',
  keys = {
    { '<leader>i', vim.cmd.IronRepl, desc = '󱠤 Open REPL' },
    { '<leader>I', vim.cmd.IronRestart, desc = '󱠤 Restart REPL' },
    { '+', mode = { 'n', 'x' }, desc = '󱠤 Send-to-REPL Operator' },
    -- { '++', desc = '󱠤 Send Line to REPL' },
  },

  config = function()
    local iron = require 'iron.core'
    local view = require 'iron.view'

    -- Set up Iron with specific configurations
    iron.setup {
      config = {
        scratch_repl = true, -- Allow creating a scratch REPL

        -- Open REPL in a vertical split at the bottom right
        repl_open_cmd = view.split.vertical.botright(0.45),

        -- Language-specific configurations
        repl_definition = {
          python = {
            format = require('iron.fts.common').bracketed_paste,
            command = { 'ipython', '--no-autoindent' },
          },
          julia = {
            command = { 'julia', '--project=.' },
          },
        },
      },

      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      keymaps = {
        send_motion = '+',
        visual_send = '+',
        -- send_file = '<space>sf',
        send_line = '++',
        -- send_paragraph = 'M',
        send_until_cursor = '<space>su',
        -- send_mark = '<space>sm',
        -- mark_motion = '<space>mc',
        -- mark_visual = '<space>mc',
        -- remove_mark = '<space>md',
        -- cr = '<space>s<cr>',
        -- interrupt = '<space>s<space>',
        -- exit = '<space>sq',
        -- clear = '<space>cl',
      },
    }
  end,

  -- Notebook Navigator: Quickly jump between and execute code cells
  {
    'GCBallesteros/NotebookNavigator.nvim',
    keys = {
      { '<leader>hX', "<cmd>lua require('notebook-navigator').run_cell()<cr>", silent = true, desc = 'Run Cell' },
      { '<leader>hx', "<cmd>lua require('notebook-navigator').run_and_move()<cr>", desc = 'Run Cell and Move' },
      { '<leader>hj', "<cmd>lua require('notebook-navigator').move_cell('d')<cr>", desc = 'Move down' },
      { '<leader>hk', "<cmd>lua require('notebook-navigator').move_cell('u')<cr>", desc = 'Move up' },
      { '<leader>hc', "<cmd>lua require('notebook-navigator').comment_cell()<cr>", desc = 'Comment cell' },
    },

    dependencies = {
      'echasnovski/mini.comment',
      'hkupty/iron.nvim', -- REPL provider, can also use molten or toggleterm
      -- 'benlubas/molten-nvim',
      -- 'akinsho/toggleterm.nvim',
      -- 'anuvyklack/hydra.nvim',
    },
    event = 'VeryLazy',

    config = function()
      local nn = require 'notebook-navigator'
      nn.setup {
        activate_hydra_keys = nil,
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
  -- {
  --   -- Enable things like vih to select code cells
  --   'echasnovski/mini.ai',
  --   event = 'VeryLazy',
  --   dependencies = { 'GCBallesteros/NotebookNavigator.nvim' },
  --   opts = function()
  --     local nn = require 'notebook-navigator'
  --     local opts = { custom_textobjects = { h = nn.miniai_spec } }
  --     return opts
  --   end,
  -- },
}

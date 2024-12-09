return {
  'Vigemus/iron.nvim',
  keys = {
    { '<leader>i', vim.cmd.IronRepl, desc = '󱠤 Open REPL' },
    { '<leader>I', vim.cmd.IronRestart, desc = '󱠤 Restart REPL' },
    { '+', mode = { 'n', 'x' }, desc = '󱠤 Send-to-REPL Operator' },
    -- { '++', desc = '󱠤 Send Line to REPL' },
  },

  -- main = 'iron.core',
  -- opts = {
  --   keymaps = {
  --     send_line = '++',
  --     visual_send = '+',
  --     send_motion = '+',
  --   },
  --
  -- },

  config = function()
    local iron = require 'iron.core'
    local view = require 'iron.view'

    -- Set up Iron with specific configurations
    iron.setup {
      config = {
        scratch_repl = true, -- Allow creating a scratch REPL
        repl_open_cmd = view.split.vertical.botright(0.5),
        repl_definition = {
          python = {
            command = function()
              local ipythonAvailable = vim.fn.executable 'ipython' == 1
              local binary = ipythonAvailable and 'ipython' or 'python3'
              return { binary }
            end,
          },
          julia = {
            command = { 'julia', '--project=.' },
          },
        },
      },
      keymaps = {
        send_motion = '+',
        visual_send = '+',
        -- send_file = '<space>sf',
        send_line = '++',
        -- send_paragraph = 'M',
        -- send_until_cursor = '<space>su',
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
}

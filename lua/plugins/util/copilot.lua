return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    -- config = function()
    --   require('copilot').setup {}
    -- end,
    opts = { suggestion = { auto_trigger = true } },
  },
  -- hide copilot suggestions when cmp menu is open
  -- to prevent odd behavior/garbled up suggestions
  -- local cmp_status_ok, cmp = pcall(require, 'cmp')
  -- if cmp_status_ok then
  --   cmp.event:on('menu_opened', function()
  --     vim.b.copilot_suggestion_hidden = true
  --   end)
  --
  --   cmp.event:on('menu_closed', function()
  --     vim.b.copilot_suggestion_hidden = false
  --   end)
  --    end
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      window = {
        layout = 'float',
      },
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      suggestion = {
        enabled = true,
        -- use the built-in keymapping for "accept" (<M-l>)
        auto_trigger = true,
        accept = false, -- disable built-in keymapping
      },
      -- filetypes = {},
    },
  },
}

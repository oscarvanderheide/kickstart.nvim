--╔════════════════════════════════════════════════════════════════════════════╗
--║                               User Interface Plugins                       ║
--╠════════════════════════════════════════════════════════════════════════════╣
--║   - nord (colortheme)                                                      ║
--║   - which-key (show available keybindings in popup as you type)            ║
--╚════════════════════════════════════════════════════════════════════════════╝

return {
  {
    'shaunsingh/nord.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'nord'
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      icons = {
        mappings = vim.g.have_nerd_font,
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = {},
      },
    },
    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
}

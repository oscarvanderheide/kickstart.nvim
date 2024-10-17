-- vim-slime: send commands to REPL
return {
  {
    'jpalardy/vim-slime',
    config = function()
      -- Set target for slime
      vim.g.slime_target = 'neovim'
      vim.g.slime_dont_ask_default = 1
      -- Use bracketed paste (for running python code in REPL)
      -- vim.g.slime_bracketed_paste = 1
      vim.g.slime_python_ipython = 1
    end,
  },
}

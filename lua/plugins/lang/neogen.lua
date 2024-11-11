-- autogen: automatically add docstrings to your functions
return {
  'danymat/neogen',
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*",
  keys = {
    { '<Leader>nf', ":lua require('neogen').generate()<CR>" },
  },
}

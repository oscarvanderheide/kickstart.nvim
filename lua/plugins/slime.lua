-- vim-slime: send commands to REPL

-- Function to open IPython in a new terminal
function IPythonOpen()
  -- Open a new terminal in a vertical split
  vim.cmd 'new' -- Create a new vertical split

  -- Use termopen to run IPython in the new terminal buffer
  local job_id = vim.fn.termopen 'ipython --matplotlib'

  -- Set the name of the new buffer
  vim.cmd 'file ipython'

  -- Make it use less lines
  vim.cmd 'resize 12'

  -- Set slime target to the new terminal
  if not vim.g.slime_default_config then
    vim.g.slime_default_config = {}
  end
  vim.g.slime_default_config['jobid'] = job_id

  -- Switch to the previous buffer
  vim.cmd 'wincmd p'
end

return {
  {
    'jpalardy/vim-slime',
  },
  {
    'hanschen/vim-ipython-cell',
    -- Function to open IPython in a new terminal
  },
}

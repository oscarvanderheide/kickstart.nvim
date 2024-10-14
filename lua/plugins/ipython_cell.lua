-- Function to open IPython in a new terminal
function IPythonOpen()
  -- Open a new terminal in a horizontal split
  vim.cmd 'vnew' -- Create a new horizontal split

  -- Use termopen to run IPython in the new terminal buffer
  local job_id = vim.fn.termopen 'ipython --matplotlib'

  -- Set the name of the new buffer
  vim.cmd 'file ipython'

  -- Make it use less lines
  -- vim.cmd 'resize 12'

  -- Set slime target to the new terminal
  if not vim.g.slime_default_config then
    vim.g.slime_default_config = {}
  end
  vim.g.slime_default_config['jobid'] = job_id

  -- Switch to the previous buffer
  vim.cmd 'wincmd p'
end

function JuliaOpen()
  -- Open a new terminal in a horizontal split
  vim.cmd 'vnew' -- Create a new horizontal split

  -- Use termopen to run IPython in the new terminal buffer
  local job_id = vim.fn.termopen { 'julia' }

  -- Set the name of the new buffer
  vim.cmd 'file julia'

  -- Make it use less lines
  -- vim.cmd 'resize 12'

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
    'hanschen/vim-ipython-cell',
  },
}

local M = {}

local function vertical_movement(prevpos)
  local newpos = vim.api.nvim_win_get_cursor(0)
  return newpos[1] - prevpos[1]
end

-- Main technique I use to navigate through files. Depending on the context
-- (e.g., Python file, Jupyter notebook, etc.), this function will move try to
-- move to the next (previous) cell first, then to the next (previous) functionc, class
-- or some other language-specific object. If no such things are found it will
-- fall back to moving to the next paragraph.
local function smart_jump(direction)
  -- Check that direction is either 'd' or 'u'
  if direction ~= 'd' and direction ~= 'u' then
    return
  end

  -- Get current cursor position to keep track of movement
  local prevpos = vim.api.nvim_win_get_cursor(0)

  -- Load notebook navigator for cell movement commands
  local nn = require 'notebook-navigator'

  local treewalker = require 'treewalker'
  -- Try to move to next function/class definition
  if direction == 'd' then
    --   vim.cmd "call <SNR>46_Python_jump('n', '\\v^(class|def|async def)>', 'W', v:count1)"
    -- require('tree-climber').goto_next()
    treewalker.move_down()
  elseif direction == 'u' then
    -- require('tree-climber').goto_prev()
    treewalker.move_up()
    --   vim.cmd "call <SNR>46_Python_jump('N', '\\v^(class|def|async def)>', 'b', v:count1)"
  end

  local delta_y = vertical_movement(prevpos)

  if math.abs(delta_y) > 1 then
    return -- Apparently we jumped to some new node that's not the line directly below
  elseif math.abs(delta_y) == 1 then
    if direction == 'd' then
      vim.cmd 'normal k'
    elseif direction == 'u' then
      vim.cmd 'normal j'
    end
  end

  -- Try to move to next code cell
  nn.move_cell(direction)

  -- If cursor moved, stop this function
  if math.abs(vertical_movement(prevpos)) > 0 then
    return
  end

  -- Fallback: move paragraph
  if direction == 'd' then
    vim.cmd 'normal! }'
  elseif direction == 'u' then
    vim.cmd 'normal! {'
  end
end

function M.down()
  smart_jump 'd'
end

function M.up()
  smart_jump 'u'
end

return M

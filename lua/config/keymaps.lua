local set = vim.keymap.set

-- General keymaps (i.e. not specific to a certain plugin)
set('n', '<C-c>', 'ciw', { noremap = true, silent = true, desc = 'Change inner word' })
set('i', '<D-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save file' })
set('n', '<D-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save file' })
set('n', '<D-a>', 'ggVG', { noremap = true, silent = true, desc = 'Select entire file' })
set('n', 'gg', 'gg0', { noremap = true, silent = true, desc = 'Move to start of line after gg' })
set('n', 'G', 'G$', { noremap = true, silent = true, desc = 'Move to end of line after G' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
set('n', 'U', '<C-r>', { noremap = true, silent = true, desc = 'Undo' })
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
set('n', '<C-x>', ':bd<CR>', { noremap = true, silent = true, desc = 'Close buffer' })
set('n', 'd', '"_d', { noremap = true, silent = true, desc = 'Delete without yanking' })
set('n', '<leader>d', 'd', { noremap = true, silent = true, desc = 'Delete with yanking' })
set('n', 'D', '"_D', { noremap = true, silent = true, desc = 'Delete without yanking' })
set('x', 'd', '"_d', { noremap = true, silent = true, desc = 'Delete without yanking' })
set('n', '<left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down and center' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up and center' })
set('n', 'n', 'nzzzv', { desc = 'Center after going to next search item' })
set('n', 'N', 'Nzzzv', { desc = 'Center after going to previous search item' })
set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
set('n', ',', '<C-^>', { noremap = true, silent = true, desc = 'Alternate two buffers' })
set('v', '\\', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })
set('n', '\\', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })
set('v', '<', '<gv', { desc = 'Indent left' })
set('v', '>', '>gv', { desc = 'Indent right' })
-- Incremental rename of current word
vim.keymap.set('n', '<leader>rn', function()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end, { expr = true })
-- Keymaps for moving up and down within a buffer
do
  -- Move to next (previous) paragraph
  set({ 'n', 'v' }, '<C-j>', '5j', { silent = true })
  set({ 'n', 'v' }, '<C-k>', '{', { silent = true })

  -- Move to next (previous) node
  set({ 'n', 'v' }, 'K', function()
    local treewalker = require 'treewalker'
    treewalker.move_up()
  end, { silent = true })

  set({ 'n', 'v' }, 'J', function()
    local treewalker = require 'treewalker'
    treewalker.move_down()
  end, { silent = true })

  -- Move to next (previous) code cell
  -- function()
  --   vim.notify 'Keymap triggered'
  --   local nn = require 'notebook-navigator'
  --   if nn and nn.move_cell then
  --     vim.notify 'Moving cell down'
  --     nn.move_cell 'd'
  --   else
  --     vim.notify 'notebook-navigator or move_cell function not found'
  --   end
  -- end, { silent = true })

  -- set({ 'n', 'v' }, '<A-k>', function()
  --   local nn = require 'notebook-navigator'
  --   nn.move_cell 'u'
  -- end, { silent = true })
end

-- REPL keymaps:
-- Send paragraph to REPL and move to next
-- set('n', '<A-j>', function()
--   -- Send the current paragraph to the REPL using Iron's send_paragraph method
--   local iron = require 'iron.core'
--   iron.send_paragraph()
--   vim.cmd 'normal! }'
-- end)

-- local smart_jump = require 'utils.smart_jump'

-- set({ 'n', 'v' }, '<C-j>', function()
--   smart_jump.down()
-- end, { silent = true })
-- set({ 'n', 'v' }, '<C-k>', function()
--   smart_jump.up()
-- end, { silent = true })
-- -- Map <C-n> in insert mode
-- set('i', '<C-n>', function()
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
--   send_paragraph_to_repl()
-- end, { desc = 'Send paragraph to REPL and move to start of next paragraph' })

-- Function to detect if cursos moved relative to previous position
-- local function cursor_moved(prevpos)
--   local newpos = vim.api.nvim_win_get_cursor(0)
--   return prevpos[1] ~= newpos[1] or prevpos[2] ~= newpos[2]
-- end
function SET_PYTHON_KEYMAPS() end

function SET_JULIA_KEYMAPS() end

-- Toggle Copilot Chat with Alt-c

-- vscode-like shortcut to comment/uncomment lines
set('n', '<D-/>', function()
  vim.cmd 'normal gcc'
end, { desc = 'Comment line' })

set('v', '<D-/>', function()
  vim.cmd 'normal gc'
end, { desc = 'Comment selection' })

-- set('n', '<leader>fs', "<Cmd>lua MiniAi.select_textobject('a', 's')<CR>")

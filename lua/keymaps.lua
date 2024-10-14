-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Modify half-page up and down to center the screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down and center' })
vim.keymap.set('n', '<C-u', '<C-u>zz', { desc = 'Half page up and center' })

-- Keep cursor in the middle when pressing n or N in search mode
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center after going to next search item' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center after going to previous search item' })

-- Move lines selected in V mode up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<localleader>mi', ':MoltenInit<CR>', { silent = true, desc = 'Initialize the plugin' })
vim.keymap.set('n', '<localleader>e', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'run operator selection' })
vim.keymap.set('n', '<localleader>rl', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'evaluate line' })
vim.keymap.set('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 're-evaluate cell' })
vim.keymap.set('v', '<localleader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'evaluate visual selection' })

-- Start new session using tmux-sessionizer (from primeagen)
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer.sh<CR>')

-- Python-specific keymaps. They are enabled through an autocommand
function SET_PYTHON_KEYMAPS()
  -- IPython-cell configuration in Lua
  -- Map <leader>s to start IPython
  vim.keymap.set('n', '<leader>ps', ':SlimeSend1 ipython --matplotlib<CR>', { desc = 'Start IPython' })
  -- Map <leader>r to run the script
  vim.keymap.set('n', '<leader>pr', ':IPythonCellRun<CR>', { desc = 'Run script' })
  -- Map <leader>R to run the script and time the execution
  vim.keymap.set('n', '<leader>pR', ':IPythonCellRunTime<CR>', { desc = 'Run script with timing' })
  -- Map <leader>c to execute the current cell
  vim.keymap.set('n', '<leader>pc', ':IPythonCellExecuteCell<CR>', { desc = 'Execute current cell' })
  -- Map <leader>C to execute the current cell and jump to the next cell
  vim.keymap.set('n', '<leader>pC', ':IPythonCellExecuteCellJump<CR>', { desc = 'Execute cell and jump to next' })
  -- Map <leader>l to clear IPython screen
  vim.keymap.set('n', '<leader>pl', ':IPythonCellClear<CR>', { desc = 'Clear IPython screen' })
  -- Map <leader>x to close all Matplotlib figure windows
  vim.keymap.set('n', '<leader>px', ':IPythonCellClose<CR>', { desc = 'Close all Matplotlib figures' })
  -- Map <leader>h to send the current line or current selection to IPython
  vim.keymap.set('n', '<leader>ph', '<Plug>SlimeLineSend', { desc = 'Send line to IPython' })
  vim.keymap.set('x', '<leader>ph', '<Plug>SlimeRegionSend', { desc = 'Send selection to IPython' })
  -- Map <leader>p to run the previous command
  vim.keymap.set('n', '<leader>pp', ':IPythonCellPrevCommand<CR>', { desc = 'Run previous command' })
  -- Map <leader>q to restart IPython
  vim.keymap.set('n', '<leader>pQ', ':IPythonCellRestart<CR>', { desc = 'Restart IPython' })
  -- Map <leader>d to start debug mode
  vim.keymap.set('n', '<leader>pd', ':SlimeSend1 %debug<CR>', { desc = 'Start debug mode' })
  -- Map <leader>q to exit debug mode or IPython
  vim.keymap.set('n', '<leader>pq', ':SlimeSend1 exit<CR>', { desc = 'Exit debug mode/IPython' })
  -- Map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
  vim.keymap.set('n', '<F9>', ':IPythonCellInsertAbove<CR>a', { desc = 'Insert cell above' })
  vim.keymap.set('n', '<F10>', ':IPythonCellInsertBelow<CR>a', { desc = 'Insert cell below' })
  vim.keymap.set('i', '<F9>', '<C-o>:IPythonCellInsertAbove<CR>', { desc = 'Insert cell above (insert mode)' })
  vim.keymap.set('i', '<F10>', '<C-o>:IPythonCellInsertBelow<CR>', { desc = 'Insert cell below (insert mode)' })

  vim.keymap.set('n', '{', ':IPythonCellPrevCell<CR>', { desc = 'Jump to previous cell' })
  vim.keymap.set('n', '}', ':IPythonCellNextCell<CR>', { desc = 'Jump to next cell' })
  vim.keymap.set('n', '<CR>', ':IPythonCellExecuteCellJump<CR>', { desc = 'Execute cell and jump to next cell' })
  -- Keymap to open IPython in a terminal
  vim.keymap.set('n', '<leader>pi', IPythonOpen, { desc = 'Open IPython in terminal' })
end

-- vim: ts=2 sts=2 sw=2 et

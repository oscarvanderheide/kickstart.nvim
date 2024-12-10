-- General keymaps (i.e. not specific to a certain plugin)

-- Shortcut for replacing a word
vim.keymap.set('n', '<C-c>', 'ciw', { noremap = true, silent = true, desc = 'Change inner word' })

-- Cmd + s to save
vim.keymap.set('i', '<D-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.keymap.set('n', '<D-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save file' })

-- Select entire file
vim.keymap.set('n', '<D-a>', 'ggVG', { noremap = true, silent = true, desc = 'Select entire file' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with <Esc><Esc>
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Remap `U` to redo (equivalent to `<C-r>`)
vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true })
-- Remap `J` to jump to the previous paragraph/"_yiw
vim.keymap.set('n', '<C-j>', '}', { noremap = true, silent = true })
-- Remap `K` to jump to the next paragraph/block
vim.keymap.set('n', '<C-k>', '{', { noremap = true, silent = true })
-- Remap `H` to move to the start of the line
vim.keymap.set('n', 'H', '^', { noremap = true, silent = true })
-- Remap `L` to move to the end of the line
vim.keymap.set('n', 'L', '$', { noremap = true, silent = true })
-- -- Remap `<C-l>` to switch to the next buffer
-- vim.keymap.set('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })
-- -- Remap `<S-Tab>` to switch to the previous buffer
-- vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

-- Remap `<C-x>` to delete the current buffer
vim.keymap.set('n', '<C-x>', ':bd<CR>', { noremap = true, silent = true })
-- Remap `d` to use the black hole register
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('x', 'd', '"_d')

-- Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Modify half-page up and down to center the screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down and center' })
vim.keymap.set('n', '<C-u', '<C-u>zz', { desc = 'Half page up and center' })

-- Keep cursor in the middle when pressing n or N in search mode
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center after going to next search item' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center after going to previous search item' })

-- Move lines selected in V mode up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Start new session using tmux-sessionizer (from primeagen)
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer.sh<CR>')

-- REPL keymaps:

-- Send paragraph to REPL and move to next
vim.keymap.set('n', '<C-S-j>', function()
  -- Send the current paragraph to the REPL using Iron's send_paragraph method
  local iron = require 'iron.core'
  iron.send_paragraph()
  -- Move to the start of the next paragraph
  vim.cmd 'normal! }'
end, { desc = 'Send paragraph to REPL and move to start of next paragraph' })

-- Switch to REPL and start insert mode
vim.keymap.set('n', '<C-l>', function()
  vim.cmd 'redraw!'
  vim.cmd 'wincmd l' -- Move to the right-hand split (REPL)
  vim.cmd 'startinsert' -- Enter terminal insert mode
end, { noremap = true, silent = true })
-- Switch from REPL back to editor
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })

-- Python-specific keymaps. They are enabled through an autocommand
function SET_PYTHON_KEYMAPS()
  -- vim.keymap.set('n', 'M', '+}}', { desc = 'Send paragraph to REPL and move to start of next paragraph' })
end

function SET_JULIA_KEYMAPS()
  -- Switch between editor and REPL
  -- vim.keymap.set('n', '<leader>k', '<C-w><C-l>i', { desc = 'Switch to REPL' })
  -- vim.keymap.set('t', '<leader>j', [[<C-\><C-n><C-w>h]], { desc = 'Switch to editor' })
  -- Copy the block move behavior from vim-julia and map to <D-j> and <D-k>
  -- vim.keymap.set('n', '<D-j>', ':<C-U>let b:jlblk_count=v:count1 | call julia_blocks#moveblock_n()<CR>', { desc = 'Move to next Julia block', silent = true })
  -- vim.keymap.set('n', '<D-J>', ':<C-U>let b:jlblk_count=v:count1 | call julia_blocks#moveblock_p()<CR>', { desc = 'Move to next Julia block', silent = true })
  -- vim.keymap.set('n', '<C-j>', ':call julia_blocks#moveblock_n()', { desc = 'Jump to next Julia block' })
  -- vim.keymap.set('n', '<C-k>', ':call julia_blocks#moveblock_p()', { desc = 'Jump to previous Julia block' })
end

-- Toggle terminal with Alt-t
-- vim.keymap.set(
--   'n',
--   '<leader>tt',
--   '<cmd>ToggleTerm direction=float float_opts={width=0.5, height=0.5}<CR><cmd>startinsert<CR>',
--   { noremap = true, silent = true, desc = 'Toggle floating terminal and enter insert mode' }
-- )

-- local toggleterm = require('toggleterm.terminal').Terminal

-- vim.keymap.set('n', '<leader>tt', function()
vim.keymap.set('n', '<C-\\>', function()
  local toggleterm = require('toggleterm.terminal').Terminal

  local float_term = toggleterm:new {
    direction = 'float',
    float_opts = {
      width = 120,
      height = 50,
    },
  }
  float_term:toggle()
end, { noremap = true, silent = true, desc = 'Toggle floating terminal' })

vim.keymap.set('t', '<C-\\>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true, desc = 'Close floating terminal' })
-- vim.keymap.set('t', '<leader>tt', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true, desc = 'Close floating terminal' })

-- Toggle Copilot Chat with Alt-c
vim.keymap.set('n', '|', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })

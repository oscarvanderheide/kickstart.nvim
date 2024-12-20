-- General keymaps (i.e. not specific to a certain plugin)
vim.keymap.set('n', '<C-c>', 'ciw', { noremap = true, silent = true, desc = 'Change inner word' })
vim.keymap.set('i', '<D-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.keymap.set('n', '<D-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.keymap.set('n', '<D-a>', 'ggVG', { noremap = true, silent = true, desc = 'Select entire file' })
vim.keymap.set('n', 'gg', 'gg0', { noremap = true, silent = true, desc = 'Move to start of line after gg' })
vim.keymap.set('n', 'G', 'G$', { noremap = true, silent = true, desc = 'Move to end of line after G' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true, desc = 'Undo' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-x>', ':bd<CR>', { noremap = true, silent = true, desc = 'Close buffer' })
vim.keymap.set('n', 'd', '"_d', { noremap = true, silent = true, desc = 'Delete without yanking' })
vim.keymap.set('n', '<leader>d', 'd', { noremap = true, silent = true, desc = 'Delete with yanking' })
vim.keymap.set('n', 'D', '"_D', { noremap = true, silent = true, desc = 'Delete without yanking' })
vim.keymap.set('x', 'd', '"_d', { noremap = true, silent = true, desc = 'Delete without yanking' })
vim.keymap.set('n', '<left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center after going to next search item' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center after going to previous search item' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
vim.keymap.set('n', ',', '<C-^>', { noremap = true, silent = true, desc = 'Alternate two buffers' })
vim.keymap.set('v', '\\', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })
vim.keymap.set('n', '\\', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })

-- Start new session using tmux-sessionizer (from primeagen)
-- vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer.sh<CR>')

-- REPL keymaps:

-- Send paragraph to REPL and move to next
vim.keymap.set('n', '<A-j>', function()
  -- Send the current paragraph to the REPL using Iron's send_paragraph method
  local iron = require 'iron.core'
  iron.send_paragraph()
  vim.cmd 'normal! }'
end)

-- -- Map <C-n> in insert mode
-- vim.keymap.set('i', '<C-n>', function()
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
--   send_paragraph_to_repl()
-- end, { desc = 'Send paragraph to REPL and move to start of next paragraph' })

-- Function to detect if cursos moved relative to previous position
local function cursor_moved(prevpos)
  local newpos = vim.api.nvim_win_get_cursor(0)
  return prevpos[1] ~= newpos[1] or prevpos[2] ~= newpos[2]
end

-- Python-specific keymaps. They are enabled through an autocommand
function SET_PYTHON_KEYMAPS()
  local sj = require 'utils.smart_jump'

  vim.keymap.set({ 'n', 'v' }, '<C-j>', function()
    sj.smart_jump 'd'
  end, { silent = true })
  vim.keymap.set({ 'n', 'v' }, '<C-k>', function()
    sj.smart_jump 'u'
  end, { silent = true })
end

function SET_JULIA_KEYMAPS() end

-- Toggle Copilot Chat with Alt-c

-- vscode-like shortcut to comment/uncomment lines
vim.keymap.set('n', '<D-/>', function()
  vim.cmd 'normal gcc'
end, { desc = 'Comment line' })

vim.keymap.set('v', '<D-/>', function()
  vim.cmd 'normal gc'
end, { desc = 'Comment selection' })

vim.keymap.set('n', '<leader>fs', "<Cmd>lua MiniAi.select_textobject('a', 's')<CR>")

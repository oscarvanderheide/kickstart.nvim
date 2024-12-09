-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Turn off line numbers and relative numbers for terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Open Telescope file finder when opening a directory
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    --   -- if vim.fn.argv(0) == '' then
    --   --   require('telescope.builtin').find_files()
    --   -- end
  end,
})

-- Prevent automatically commenting lines
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove { 'r', 'o', 'c' }
  end,
})

-- Is this needed for the vim tip autocommand?
-- local function augroup(name)
--   return vim.api.nvim_create_augroup(name, { clear = true })
-- end
--
-- Show vim tip on startup
-- vim.api.nvim_create_autocmd('VimEnter', {
--   group = augroup 'vimtip',
--   callback = function()
--     local job = require 'plenary.job'
--     job
--       :new({
--         command = 'curl',
--         args = { 'https://vtip.43z.one' },
--         on_exit = function(j, exit_code)
--           local res = table.concat(j:result())
--           if exit_code ~= 0 then
--             res = 'Error fetching tip: ' .. res
--           end
--           vim.notify(res, 2, { title = 'Tip!' })
--         end,
--       })
--       :start()
--   end,
-- })

-- Set python specific options and keymaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python', -- Only apply to Python files
  callback = SET_PYTHON_KEYMAPS,
})

-- Set julia specific options and keymaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'julia',
  callback = SET_JULIA_KEYMAPS,
  -- callback = function()
  --   -- Unmap existing `}` in the buffer (if any)
  --   -- vim.api.nvim_buf_del_keymap(0, 'n', '}')
  --   -- vim.api.nvim_buf_del_keymap(0, 'n', '{')
  --   local navbuddy_actions = require 'nvim-navbuddy.actions'
  --
  --   -- Map } to move to the next sibling (down)
  --   vim.keymap.set('n', '}', navbuddy_actions.next_sibling, { noremap = true, silent = true, desc = 'Go to next sibling' })
  --
  --   -- Map { to move to the previous sibling (up)
  --   vim.keymap.set('n', '{', navbuddy_actions.previous_sibling, { noremap = true, silent = true, desc = 'Go to previous sibling' })
  --   -- Remap `}` to move to the next Julia block
  --   -- vim.keymap.set('n', '}', function()
  --   --   local initial_pos = vim.fn.getpos '.'
  --   --   vim.cmd 'let b:jlblk_count=v:count1 | call julia_blocks#moveblock_n()'
  --   --
  --   --   -- Check if the cursor moved
  --   --   local new_pos = vim.fn.getpos '.'
  --   --   if initial_pos[2] == new_pos[2] and initial_pos[3] == new_pos[3] then
  --   --     -- If the position didn't change, fallback to `}`
  --   --     vim.cmd 'normal! }'
  --   --   end
  --   -- end, { desc = 'Move to next Julia block or next paragraph', silent = true })
  --   --
  --   -- -- Remap `}` to move to the next Julia block
  --   -- vim.keymap.set('n', '{', function()
  --   --   local initial_pos = vim.fn.getpos '.'
  --   --   vim.cmd 'let b:jlblk_count=v:count1 | call julia_blocks#moveblock_p()'
  --   --
  --   --   -- Check if the cursor moved
  --   --   local new_pos = vim.fn.getpos '.'
  --   --   if initial_pos[2] == new_pos[2] and initial_pos[3] == new_pos[3] then
  --   --     -- If the position didn't change, fallback to `{`
  --   --     vim.cmd 'normal! {'
  --   --   end
  --   -- end, { desc = 'Move to previous Julia block or previous paragraph', silent = true })
  --   --
  --   -- SET_JULIA_KEYMAPS()
  -- end,
})

-- Open help in a vertical split instead of a horizontal split
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function()
    vim.cmd 'wincmd L' -- Move help buffer to a vertical split on the right
  end,
})

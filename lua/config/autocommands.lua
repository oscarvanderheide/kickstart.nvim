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
    if vim.fn.argv(0) == '.' then
      require('telescope.builtin').find_files()
      -- require('telescope').extensions.smart_open.smart_open()
    end
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
  callback = function()
    SET_JULIA_KEYMAPS()
    vim.g.ipython_cell_run_command = 'include("{filepath}")'
    vim.g.ipython_cell_cell_command = 'include_string(Main, clipboard())'
  end,
})

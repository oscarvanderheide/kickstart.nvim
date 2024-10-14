-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set python specific keymaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python', -- Only apply to Python files
  callback = SET_PYTHON_KEYMAPS,
})

-- Set julia specific keymaps and options
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'julia',
  callback = function()
    vim.g.ipython_cell_run_command = 'include("{filepath}")'
    vim.g.ipython_cell_cell_command = 'include_string(Main, clipboard())'
  end,
})
-- vim: ts=2 sts=2 sw=2 et

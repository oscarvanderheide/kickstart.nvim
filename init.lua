-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Initialize Lazy (plugin manager)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Load options defined in lua/options.lua
require 'options'
-- Load keymaps defined in lua/keymaps.lua
require 'keymaps'
-- Load autocommands defined in lua/autocommands.lua
require 'autocommands'
-- Load plugins defined in lua/plugins/*.lua
require('lazy').setup 'plugins'

-- Not sure if this is needed anymore for connecting to python kernel
vim.g.python3_host_prog = '/opt/homebrew/opt/python@3.10/bin/python3.10'

-- -- Disable netrw to prevent it from opening when entering a directory
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Autocmd to open Telescope file finder when opening a directory
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argv(0) == '' then
      require('telescope.builtin').find_files()
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et

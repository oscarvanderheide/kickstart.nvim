-- Cinnamon: smooth scrolling
-- Smear: smooth cursor movement
return {
  'declancm/cinnamon.nvim',
  opts = {
    keymaps = {
      basic = true, -- enables a smooth scrolling for a few movements
      extra = false, -- additional movements, I think it's a bit too much
    },
  },
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
}

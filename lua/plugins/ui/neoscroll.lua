return {
  'declancm/cinnamon.nvim',
  version = '*', -- use latest release
  opts = {
    -- change default options here
    disabled = false,
    keymaps = {
      basic = true,
      extra = false,
    },
  },
}
-- -- neoscroll: smooth scrolling
--
-- return {
--   'karb94/neoscroll.nvim',
--   config = function()
--     require('neoscroll').setup {
--       -- easing = 'sine',
--     }
--   end,
-- }

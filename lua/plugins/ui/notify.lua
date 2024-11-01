-- notify: Change settings of popup floating menys
return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  -- config = function(_, opts)
  --   local job = require 'plenary.job'
  --   job
  --     :new({
  --       command = 'curl',
  --       args = { 'https://vtip.43z.one' },
  --       on_exit = function(j, exit_code)
  --         local res = table.concat(j:result())
  --         if exit_code ~= 0 then
  --           res = 'Error fetching tip: ' .. res
  --         end
  --         require 'notify'(res)
  --       end,
  --     })
  --     :start()
  -- end,
  opts = {
    top_down = true,
    timeout = 2500,
    fps = 60,
    max_width = 70,
  },
}

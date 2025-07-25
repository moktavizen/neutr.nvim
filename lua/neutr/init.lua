local M = {}

function M.setup(user_opts)
  local config = require('neutr.config')
  config.opts = vim.tbl_deep_extend('force', config.opts, user_opts or {})
end

return M

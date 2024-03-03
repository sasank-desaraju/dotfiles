---@type ChadrcConfig 
local M = {}    -- what is M ??
M.ui = {
  theme = 'kanagawa',
  nvdash = {
    load_on_startup = true,
  },
}
M.plugins = 'custom.plugins'
M.mappings = require("custom.mappings")
--local cmp = require("cmp")
return M

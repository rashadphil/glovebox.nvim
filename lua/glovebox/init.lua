local util = require("glovebox.util")
local theme = require("glovebox.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M

-- ╭─────────────────────────────────────────────────────────╮
-- │                         Plugins                         │
-- ╰─────────────────────────────────────────────────────────╯


local M = {}

function M.apply(palette, scheme)
  local M = require("highlights.plugins.git-signs").apply(palette, scheme)
  M = require("highlights.plugins.neo-tree").apply(palette, M)

  return M
end

return M

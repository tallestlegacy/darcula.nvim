-- ╭─────────────────────────────────────────────────────────╮
-- │                         Plugins                         │
-- ╰─────────────────────────────────────────────────────────╯


local M = {}

function M.apply(palette, scheme)
  local sch = require("highlights.plugins.git-signs").apply(palette, scheme)
  sch = require("highlights.plugins.neo-tree").apply(palette, sch)
  sch = require("highlights.plugins.indent-blankline").apply(palette, sch)

  return sch
end

return M

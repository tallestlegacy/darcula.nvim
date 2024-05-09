return {
  apply = function(palette, scheme)
    local M = {
      IblScope = { fg = palette.layers.light[4] },
    }

    return require("utils.helpers").mergeTables(scheme, M)
  end
}

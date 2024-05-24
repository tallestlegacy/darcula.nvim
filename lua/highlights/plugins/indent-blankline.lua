return {
  apply = function(palette, scheme)
    local M = {
      IblScope = { fg = palette.layers.light[6] },
      IblIndent = { fg = palette.layers.light[1] },
    }

    return require("utils.helpers").mergeTables(scheme, M)
  end
}

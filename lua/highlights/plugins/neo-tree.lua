return {
  apply = function(palette, scheme)
    local M = {
      NeoTreeNormal = { bg = palette.ui.sidebar.bg },
      NeoTreeNormalNC = { link = "NeoTreeNormal" },
      NeoTreeSignColumn = { link = "NeoTreeNormal" },
      NeoTreeEndOfBuffer = { fg = palette.ui.sidebar.bg, bg = palette.ui.sidebar.bg },
      NeoTreeStatusLine = { link = "NeoTreeEndOfBuffer" },
      NeoTreeWinSeparator = { fg = palette.bg },
    }

    return require("utils.helpers").mergeTables(scheme, M)
  end
}

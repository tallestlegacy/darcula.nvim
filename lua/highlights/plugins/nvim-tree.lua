---@diagnostic disable: unused-local

return {
  apply = function(palette, scheme)
    local M = {
      NvimTreeNormal = { bg = palette.ui.sidebar.bg },
      NvimTreeNormalNC = { link = "NvimTreeNormal" },
      NvimTreeNormalFloat = { link = "NvimTreeNormal" },
      NvimTreeSignColumn = { link = "NvimTreeNormal" },
      NvimTreeEndOfBuffer = { fg = palette.ui.sidebar.bg, bg = palette.ui.sidebar.bg },
      NvimTreeStatusLine = { link = "NvimTreeEndOfBuffer" },
      NvimTreeWinSeparator = { fg = palette.bg },
    }

    return require("utils.helpers").mergeTables(scheme, M)
  end,
}

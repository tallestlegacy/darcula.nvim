return {
  apply = function(palette, scheme)
    local M = {
      GitSignsAdd = { fg = palette.git.add.fg },
      GitSignsChange = { fg = palette.git.change.fg },
      GitSignsDelete = { fg = palette.git.delete.text },

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

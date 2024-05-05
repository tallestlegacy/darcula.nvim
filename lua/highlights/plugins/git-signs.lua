return {
  apply = function(palette, scheme)
    local M = {
      GitSignsAdd = { fg = palette.git.add.fg },
      GitSignsChange = { fg = palette.git.change.fg },
      GitSignsDelete = { fg = palette.git.delete.text },
    }

    return require("utils.helpers").mergeTables(scheme, M)
  end
}

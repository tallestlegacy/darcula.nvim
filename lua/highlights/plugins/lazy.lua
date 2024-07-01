return {
  apply = function(palette, scheme)
    local M = {
      LazyProgressTodo = { fg = palette.layers.light[5], bg = palette.layers.light[2] }
    }

    return require("utils.helpers").mergeTables(scheme, M)
  end
}

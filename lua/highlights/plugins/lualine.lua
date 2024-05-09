local palette = require("darcula.palette").default

return {
  normal = {
    a = { bg = palette.layers.light[5], fg = palette.colors.white, gui = "bold" },
    b = { bg = palette.layers.light[3], fg = palette.colors.white },
    c = { bg = palette.ui.statusline.bg, fg = palette.ui.statusline.fg },
  },
  insert = {
    a = { bg = palette.colors.darkgreen, fg = palette.colors.black, gui = "bold" },
  },
  visual = {
    a = { bg = palette.colors.lightblue, fg = palette.colors.black, gui = "bold" },
  },
  command = {
    a = { bg = palette.colors.orange, fg = palette.colors.black, gui = "bold" },
  },
  terminal = {
    a = { bg = palette.colors.purple, fg = palette.colors.black, gui = "bold" },
  },
  inactive = {
    a = { bg = palette.ui.statusline.bg, fg = palette.ui.statusline.fg, gui = "bold" }
  },
  replace = {
    a = { bg = palette.colors.darkred, fg = palette.ui.statusline.fg, gui = "bold" }
  },
}

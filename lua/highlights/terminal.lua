local M = {}

M.apply = function(palette)
  vim.g.terminal_color_0 = palette.black
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.purple
  vim.g.terminal_color_6 = palette.lightblue
  vim.g.terminal_color_7 = palette.white
  vim.g.terminal_color_8 = palette.grey
  vim.g.terminal_color_9 = palette.red
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.yellow
  vim.g.terminal_color_12 = palette.blue
  vim.g.terminal_color_13 = palette.purple
  vim.g.terminal_color_14 = palette.lightblue
  vim.g.terminal_color_15 = palette.white
end

return M

local lush = require("lush")
local hsl = lush.hsl

local M = {}

M.white = hsl(0, 0, 80)
M.yellow = hsl(50, 83, 73)
M.orange = hsl(15, 78, 52)
M.darkred = hsl(15, 74, 40)
M.purple = hsl(270, 23, 63)
M.green = hsl(140, 100, 50)
M.grey = hsl(0, 0, 50)
M.darkgreen = hsl(115, 50, 43)
M.lightblue = hsl(210, 63, 63)
M.blue = hsl(210, 78, 33)


-- Base colors
M.c0 = hsl(240, 1, 15)
M.c1 = M.c0.lighten(5)
M.c2 = M.c1.lighten(2)
M.c3 = M.c2.lighten(20).sa(10)
M.c4 = M.c3.lighten(10)
M.c5 = M.c4.lighten(20)
M.c6 = M.c5.lighten(70)


-- Base palette
M.bg = M.c0
M.fg = hsl(210, 7, 82)


-- UI
M.border = M.fg

--
return M

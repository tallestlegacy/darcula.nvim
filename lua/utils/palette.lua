local lush = require("lush")
local hsl = lush.hsl

local function getPallette()
  local M = {}

  M.colors = {
    black = hsl(0, 0, 0),
    white = hsl(0, 0, 80),
    grey = hsl(0, 0, 50),

    blue = hsl(199, 69, 20),
    lightblue = hsl(210, 63, 63),

    darkgreen = hsl(108, 28, 46),
    green = hsl(120, 61, 50),

    darkred = hsl(17, 61, 40),
    red = hsl(0, 100, 50),

    orange = hsl(27, 61, 50),
    purple = hsl(279, 23, 56),
    yellow = hsl(51, 76, 72),
  }

  --
  -- Base colors
  --
  M.base = hsl(0, 0, 16)

  --
  -- layers
  --
  M.layers = {
    dark = {
      M.base.da(10),
      M.base.da(20),
      M.base.da(30),
      M.base.da(40),
      M.base.da(50),
    },
    light = {
      M.base.da(-5),
      M.base.da(-10),
      M.base.da(-15),
      M.base.da(-20),
      M.base.da(-25),
      M.base.da(-30),
      M.base.da(-35),
      M.base.da(-40),
      M.base.da(-45),
      M.base.da(-50),
      M.base.da(-55),
      M.base.da(-60),
    },
  }

  --
  -- Base palette
  --
  M.fg = hsl(210, 7, 82)
  M.bg = M.base
  M.overbg = M.layers.light[1]

  --
  -- UI
  --
  M.ui = {
    border = M.layers.light[4],
    tabline = {
      fg = M.layers.light[2],
      bg = M.layers.dark[1],
      active = {
        fg = M.white,
        bg = M.layers.light[1]
      },
      inactive = {
        fg = M.grey,
        bg = M.layers.dark[2],
      }
    },
    statusline = {
      fg = M.white,
      bg = M.layers.light[1],
    },
    sidebar = {
      fg = M.layers.light[3],
      bg = M.layers.dark[3],
    },
    menu = {
      fg = M.colors.white,
      bg = M.layers.dark[2],
      sel = { fg = M.white, bg = M.layers.light[2] },
    },
    directory = M.colors.lightblue,
  }

  --
  -- Editor
  --
  M.editor = {
    selection = hsl(200, 38, 18),
  }

  --
  -- Syntax/Semantic highlights
  --
  M.text = {
    comment = M.colors.grey,

    -- diagnostics etc.
    error = M.colors.red,
    warn = M.colors.orange,
    info = M.colors.lightblue.da(-40),
    todo = M.colors.green,
  }

  --
  -- Git
  --
  M.git = {
    diff   = {
      text = hsl(49, 16, 27),
    },
    add    = {
      fg = M.colors.green,
      bg = hsl(120, 16, 19),
      text = M.colors.darkgreen,
    },
    change = {
      fg = M.layers.light[8],
      bg = M.layers.light[2],
      text = M.colors.yellow,
    },
    delete = {
      fg = M.colors.red,
      bg = hsl(0, 27, 19),
      text = hsl(0, 100, 73),
    }
  }
  return M
end

return {
  getPallette = getPallette,
  default = getPallette(),
}

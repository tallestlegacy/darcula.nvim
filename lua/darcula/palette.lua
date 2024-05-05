local function getPallette()
  local M = {}

  M.colors = {
    black = "#000000",
    white = "#d0d0d0",
    grey = "#808080",
    red = "#aa2222",
    darkred = "#a34a27",
    orange = "#cc7832",
    yellow = "#eedd82",
    green = "#32cd32",
    darkgreen = "#629755",
    lightblue = "#6897bb",
    blue = "#104158",
    purple = "#9876aa",
  }

  --
  -- Base colors
  --
  M.base = "#282828"

  --
  -- layers
  --
  M.layers = {
    dark = {
      "#202020",
      "#1a1a1a",
      "#151515",
      "#111111",
      "#0e0e0e",
    },
    light = {
      "#333333",
      "#3d3d3d",
      "#474747",
      "#505050",
      "#595959",
      "#616161",
      "#696969",
      "#717171",
    },
  }

  --
  -- Base palette
  --
  M.fg = "#ced1d4"
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
      bg = M.layers.dark[1],
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
    selection = "#1c343f",
  }

  --
  -- Syntax/Semantic highlights
  --
  M.text = {
    comment = M.colors.grey,

    -- diagnostics etc.
    error = M.colors.red,
    warn = M.colors.orange,
    info = M.colors.lightblue,
    todo = M.colors.green,
  }

  --
  -- Git
  --
  M.git = {
    diff   = {
      text = "#504c3a",
    },
    add    = {
      fg = M.colors.green,
      bg = "#293829",
      text = M.colors.darkgreen,
    },
    change = {
      fg = M.layers.light[8],
      bg = M.layers.light[2],
      text = M.colors.yellow,
    },
    delete = {
      fg = M.colors.red,
      bg = "#3e2323",
      text = "#ff7575",
    }
  }
  return M
end

return {
  getPallette = getPallette,
  default = getPallette(),
}

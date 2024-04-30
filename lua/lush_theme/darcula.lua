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
M.grey00 = hsl(0, 0, 9)  -- default background
M.grey01 = hsl(0, 0, 16) -- lighter background (used for status bars, line number and folding marks)
M.grey02 = hsl(0, 0, 22) -- selection background
M.grey03 = hsl(0, 0, 35) -- comments, invisibles, line highlighting
M.grey04 = hsl(0, 0, 72) -- dark foreground (used for status bars)
M.grey05 = hsl(0, 0, 85) -- default foreground, caret, delimiters, operators
M.grey06 = hsl(0, 0, 91) -- light foreground (not often used)
M.grey07 = hsl(0, 0, 97) -- light background (not often used)
-- Base palette
M.bg = M.grey01
M.fg = hsl(210, 7, 82)
-- layers
M.overbg = M.grey02
M.pop = M.grey03
-- Text
M.comment = M.grey03
M.error = M.red
M.warn = M.orange
M.info = M.grey05
-- UI
M.border = M.fg


-- TODO: fix all debug colors
local magenta = hsl(318, 100, 28)
local debug = { bg = magenta, fg = M.blue }


local bold, italic, underline = "bold", "italic", "underline";


local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                        Builtin                          │
    -- ╰─────────────────────────────────────────────────────────╯

    -- layers
    Normal { fg = M.fg, bg = M.bg },          -- background color
    NormalFloat { fg = M.fg, bg = M.grey02 }, -- modal UI
    NormalNC { fg = M.fg },

    Visual { bg = M.blue },
    VisualNOS { fg = debug.fg, bg = debug.bg },

    -- cursors
    Cursor { fg = M.bg, bg = M.fg },
    CursorLine { bg = M.overbg },
    CursorColumn { CursorLine },
    TermCursor { Cursor },
    MatchParen { bg = M.grey03 },

    -- gutter
    LineNr { fg = M.fg, bg = M.purple },
    LineNrAbove { fg = M.fg.da(50) },
    LineNrBelow { fg = M.fg.da(50) },
    CursorLineNr { fg = M.fg },

    -- highlight
    Search { fg = M.white, bg = M.blue },
    IncSearch = { Search },
    Substitute = { Search },

    -- diffs
    DiffAdd { fg = M.darkgreen.da(20) },
    DiffAdded { DiffAdd },
    DiffChange { fg = M.yellow.da(20) },
    DiffDelete { fg = M.red },
    DiffRemoved { DiffDelete },
    DiffText { DiffChange, gui = underline },

    -- spell
    SpellBad { fg = M.yellow, gui = underline },

    -- statusline
    StatusLine { fg = M.grey04, bg = M.overbg },
    StatusLineNC { bg = M.grey00 },

    -- tabs
    TabLine = { bg = M.grey00 },
    TabLineFill = { bg = M.grey00 },
    TabLineSel = { fg = M.orange, bg = M.grey00 },


    -- pop-up menus
    Pmenu { fg = M.grey05, bg = M.grey00 },
    PmenuSel { bg = M.grey02 },
    PmenuSbar { Pmenu },
    PmenuThumb { PmenuSel },
    WildMenu { Pmenu },
    QuickFixLine { fg = M.grey05 },

    -- others
    Directory { fg = M.white },
    Title { fg = M.yellow },

    -- syntax highlighting



  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap

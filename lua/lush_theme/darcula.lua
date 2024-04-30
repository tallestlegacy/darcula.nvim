local lush = require("lush")
local hsl = lush.hsl


local M = {}

M.white = hsl(0, 0, 80)
M.yellow = hsl(51, 76, 72)
M.orange = hsl(27, 61, 50)
M.darkred = hsl(17, 61, 40)
M.purple = hsl(279, 23, 56)
M.green = hsl(120, 61, 50)
M.grey = hsl(0, 0, 50)
M.darkgreen = hsl(108, 28, 46)
M.lightblue = hsl(210, 63, 63)
M.blue = hsl(199, 69, 20)
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
M.comment = M.grey
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

    Comment { fg = M.comment, gui = italic },

    Constant { fg = M.lightblue },
    Number { Constant },
    Float { Number },
    Boolean { Constant },
    Character { fg = M.white },
    String { fg = M.darkgreen },

    Identifier { fg = M.fg },
    Function { fg = M.yellow },

    Statement { fg = M.orange }, -- (preferred) any statement
    Label { fg = M.purple },     -- case, default, etc.
    Keyword { Statement },       -- any other keyword
    Conditional { Statement },
    Repeat { Statement },
    Operator { fg = M.fg },
    Exception { fg = M.red },

    PreProc { fg = M.orange }, --  generic Preprocessor
    Include { PreProc },       -- preprocessor #include
    Define { PreProc },        -- preprocessor #define
    Macro { PreProc },         -- same as Define
    PreCondit { PreProc },     -- preprocessor #if, #else, #endif, etc.

    Type { fg = M.fg },
    Typedef { Type },
    StorageClass { fg = M.purple }, -- static, register, volatile, etc.
    Structure { StorageClass },     -- struct, union, enum, etc.

    Special { fg = M.orange },      -- (preferred) any special symbol
    SpecialChar { Special },        -- special character in a constant
    Tag { fg = M.yellow },          -- you can use CTRL-] on this
    Delimiter { Special },          -- character that needs attention
    SpecialComment { Special },     -- special things inside a comment
    Debug { Special },              -- debugging statements


    Underlined { gui = underline },
    Bold { gui = bold },
    Italic { gui = italic },
    Ignore { fg = M.comment },         --  left blank, hidden  |hl-Ignore|
    Error { fg = M.error },            --  any erroneous construct
    Todo { fg = M.green, gui = bold }, --  anything that needs extra attention

  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap

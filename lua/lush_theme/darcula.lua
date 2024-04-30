-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8

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
    LineNr { fg = M.grey02 },
    LineNrAbove { fg = M.fg.da(50) },
    LineNrBelow { fg = M.fg.da(50) },
    CursorLineNr { fg = M.fg, gui = bold },

    -- highlight
    Search { fg = M.white, bg = M.blue },
    IncSearch = { Search },
    Substitute = { Search },

    -- diffs
    DiffAdd { fg = M.darkgreen.da(20) },
    DiffAdded { DiffAdd },
    DiffChange { fg = M.yellow.da(20) },
    DiffDelete { fg = M.error },
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
    Exception { fg = M.error },

    PreProc { fg = M.green }, --  generic Preprocessor
    Include { PreProc },      -- preprocessor #include
    Define { PreProc },       -- preprocessor #define
    Macro { PreProc },        -- same as Define
    PreCondit { PreProc },    -- preprocessor #if, #else, #endif, etc.

    Type { fg = M.yellow },
    Typedef { Type },
    StorageClass { fg = M.purple }, -- static, register, volatile, etc.
    Structure { StorageClass },     -- struct, union, enum, etc.

    Special { fg = M.orange },      -- (preferred) any special symbol
    SpecialChar { Special },        -- special character in a constant
    Tag { fg = M.orange },          -- you can use CTRL-] on this
    Delimiter { Special },          -- character that needs attention
    SpecialComment { Special },     -- special things inside a comment
    Debug { Special },              -- debugging statements


    Underlined { gui = underline },
    Bold { gui = bold },
    Italic { gui = italic },
    Ignore { fg = M.comment },         --  left blank, hidden  |hl-Ignore|
    Error { fg = M.error },            --  any erroneous construct
    Todo { fg = M.green, gui = bold }, --  anything that needs extra attention


    -- ╭─────────────────────────────────────────────────────────╮
    -- │                     treesitter                          │
    -- ╰─────────────────────────────────────────────────────────╯

    sym "@constant" { Constant },
    sym "@constant.builtin" { Constant, gui = italic }, -- constant that are built in the language: `nil` in Lua.
    sym "@constant.macro" { Constant, gui = bold },     -- constants that are defined by macros: `NULL` in C.
    sym "@number" { Number },
    sym "@float" { Float },
    sym "@boolean" { Boolean },
    sym "@character" { Character },
    sym "@string" { String },
    sym "@string.regex" { Character },
    sym "@string.escape" { Character },           -- escape characters within a string
    sym "@symbol" { fg = M.green, gui = italic }, -- For identifiers referring to symbols or atoms.


    sym "@field" { fg = M.purple },
    sym "@property" { fg = M.purple },
    sym "@parameter" { fg = M.fg },
    sym "@parameter.reference" { fg = M.fg },
    sym "@variable" { fg = M.fg },                      -- Any variable name that does not have another highlight
    sym "@variable.builtin" { Constant, gui = italic }, -- Variable names that are defined by the languages like `this` or `self`.


    sym "@function" { Function },
    sym "@function.builtin" { Function },
    sym "@function.macro" { Function }, -- macro defined functions: each `macro_rules` in Rust
    sym "@method" { Function },
    sym "@constructor" { fg = M.fg },   -- For constructor: `{}` in Lua and Java constructors.
    sym "@keyword.function" { Keyword },

    sym "@keyword" { Keyword },
    sym "@conditional" { Conditional },
    sym "@repeat" { Repeat },
    sym "@label" { Label },
    sym "@operator" { Operator },
    sym "@exception" { Exception },

    sym "@namespace" { PreProc },  -- identifiers referring to modules and namespaces.
    sym "@annotation" { PreProc }, -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
    sym "@attribute" { PreProc },  -- Unstable
    sym "@include" { PreProc },    -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

    sym "@type" { Type },
    sym "@type.builtin" { Type, gui = italic },

    sym "@comment" { Comment },
    sym "@punctuation.bracket" { fg = M.fg },   -- brackets and parens.
    sym "@punctuation.delimiter" { Delimiter }, -- delimiters ie: `.`
    sym "@punctuation.special" { Delimiter },   -- special punctutation that does not fall in the catagories before.
    sym "@tag" { Tag },                         -- Tags like html tag names.da
    sym "@tag.delimiter" { fg = M.white },      -- Tag delimiter like < > /
    sym "@text" { fg = M.fg },
    sym "@text.emphasis" { fg = M.fg, gui = italic },
    sym "@text.literal" { String }, -- Literal text
    sym "@text.strike" { Comment, gui = underline },
    sym "@text.strong" { fg = M.fg, gui = bold },
    sym "@text.title" { fg = M.orange },            -- Text that is part of a title
    sym "@text.underline" { fg = M.fg, gui = underline },
    sym "@text.uri" { fg = M.green, gui = italic }, -- Any URI like a link or email
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap

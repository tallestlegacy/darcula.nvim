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
M.red = hsl(0, 100, 50)
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
M.sidebar = M.bg.da(20)
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


local bold, italic, underline, undercurl, underdashed, strikethrough =
    "bold", "italic", "underline", "undercurl", "underdashed", "strikethrough";


local theme = lush(
  function(injected_functions)
    local sym = injected_functions.sym

    return {

      -- ╭─────────────────────────────────────────────────────────╮
      -- │                        Builtin                          │
      -- ╰─────────────────────────────────────────────────────────╯

      -- layers
      Normal { fg = M.fg, bg = M.bg },          -- background color
      NormalFloat { fg = M.fg, bg = M.grey02 }, -- modal UI
      FloatBorder { fg = M.grey04 },            -- Border of floating windows.
      FloatTitle { FloatBorder },               -- Title of floating windows.
      NormalNC { fg = M.fg },

      Visual { bg = M.blue },
      VisualNOS { fg = debug.fg, bg = debug.bg },

      -- cursors
      Cursor { fg = M.bg, bg = M.fg },
      CursorLine { bg = M.overbg },
      CursorColumn { CursorLine },
      Conceal { fg = M.grey03 },
      TermCursor { Cursor },
      MatchParen { bg = M.grey03 },
      Whitespace { fg = M.overbg }, -- also used by indent-blank-line

      -- gutter
      LineNr { fg = M.grey04, bg = M.bg },
      LineNrAbove { fg = M.fg.da(50) },
      LineNrBelow { fg = M.fg.da(50) },
      CursorLineNr { fg = M.fg, gui = bold },
      SignColumn { LineNr },
      VertSplit { fg = M.bg.da(-25), bg = M.bg }, -- column separating vertically split windows
      Folded { fg = M.comment, bg = M.overbg },
      FoldColumn { LineNr },

      -- highlight
      Search { fg = M.white, bg = M.blue },
      IncSearch = { Search },
      Substitute = { Search },

      -- diffs
      DiffAdd { bg = hsl(108, 28, 18) },
      DiffAdded { DiffAdd },
      DiffTextAdded { DiffAdd },
      DiffChange { bg = hsl(49, 16, 27) },
      DiffText { bg = M.grey02 },
      DiffTextChange { DiffChange },
      DiffDelete { fg = M.red, bg = hsl(0, 27, 19) },
      DiffTextDeleted { DiffDelete },
      DiffRemoved { DiffDelete },

      -- spell
      SpellBad { gui = undercurl },

      -- statusline
      StatusLine { fg = M.grey04, bg = M.overbg },
      StatusLineNC { bg = M.grey00 },

      -- tabs
      TabLine = { bg = M.grey00 },
      TabLineFill = { bg = M.grey00 },
      TabLineSel = { fg = M.orange, bg = M.grey00 },

      -- pop-up menus
      Pmenu { fg = M.grey05, bg = M.grey03 },
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

      Identifier { fg = M.white },
      Function { fg = M.orange },

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
      Delimiter { fg = M.white },     -- character that needs attention
      SpecialComment { Special },     -- special things inside a comment
      Debug { Special },              -- debugging statements

      Underlined { gui = underline },
      Bold { gui = bold },
      Italic { gui = italic },
      Ignore { fg = M.comment },         --  left blank, hidden  |hl-Ignore|
      Error { fg = M.error },            --  any erroneous construct
      Todo { fg = M.green, gui = bold }, --  anything that needs extra attention

      -- diagnostics
      DiagnosticError { fg = M.error },
      DiagnosticWarn { fg = M.warn },
      DiagnosticInfo { fg = M.info },
      DiagnosticHint { fg = M.info },
      DiagnosticOk { fg = M.green },
      DiagnosticVirtualTextError { DiagnosticError },
      DiagnosticVirtualTextWarn { DiagnosticWarn },
      DiagnosticVirtualTextInfo { DiagnosticInfo },
      DiagnosticVirtualTextHint { DiagnosticHint },
      DiagnosticVirtualTextOk { DiagnosticOk },
      DiagnosticUnderlineError { gui = undercurl, sp = M.error },
      DiagnosticUnderlineWarn { gui = undercurl, sp = M.warn },
      DiagnosticUnderlineInfo { gui = undercurl, sp = M.info },
      DiagnosticUnderlineHint { gui = undercurl, sp = M.info },
      DiagnosticUnderlineOk { gui = undercurl, sp = M.green },
      DiagnosticFloatingError { DiagnosticError },
      DiagnosticFloatingWarn { DiagnosticWarn },
      DiagnosticFloatingInfo { DiagnosticInfo },
      DiagnosticFloatingHint { DiagnosticHint },
      DiagnosticFloatingOk { DiagnosticOk },
      DiagnosticSignError { DiagnosticError },
      DiagnosticSignWarn { DiagnosticWarn },
      DiagnosticSignInfo { DiagnosticInfo },
      DiagnosticSignHint { DiagnosticHint },
      DiagnosticSignOk { DiagnosticOk },
      DiagnosticUnnecessary { Comment, gui = underdashed },
      DiagnosticDeprecated { gui = strikethrough },

      -- ╭─────────────────────────────────────────────────────────╮
      -- │                     treesitter                          │
      -- ╰─────────────────────────────────────────────────────────╯

      sym "@constant" { Constant },
      sym "@constant.builtin" { Constant, gui = italic }, -- constant that are built in the language: `nil` in Lua.
      sym "@constant.macro" { Constant, gui = bold },
      sym "@constant.numeric" { fg = M.lightblue },

      sym "@number" { Number },
      sym "@float" { Float },
      sym "@boolean" { Boolean },
      sym "@character" { Character },
      sym "@string" { String },
      sym "@string.regex" { Character },
      sym "@string.escape" { Character },            -- escape characters within a string
      sym "@symbol" { fg = M.purple, gui = italic }, -- For identifiers referring to symbols or atoms.

      sym "@field" { fg = M.purple },
      sym "@property" { fg = M.purple }, -- the key in key/value pairs
      sym "@parameter" { fg = M.yellow },
      sym "@parameter.reference" { fg = M.blue },

      sym "@variable" { fg = M.fg },                      -- Any variable name that does not have another highlight
      sym "@variable.builtin" { Constant, gui = italic }, -- Variable names that are defined by the languages like `this` or `self`.
      sym "@variable.member" { Constant },
      sym "@variable.parameter.builtin" { Constant },     -- special parameters (e.g. _, it)

      sym "@function" { Function },                       -- function definitions
      sym "@function.builtin" { Function },               -- built-in functions
      sym "@function.constructor" { fg = M.yellow },      -- For constructor: `{}` in Lua and Java constructors.
      sym "@function.macro" { Function },                 -- macro defined functions: each `macro_rules` in Rust
      sym "@function.method" { Function },

      sym "@keyword" { Keyword },                 -- keywords not fitting into specific categories
      sym "@keyword.conditional" { Conditional }, -- keywords related to conditionals (e.g. if, else)
      sym "@keyword.function" { Keyword },
      sym "@keyword.repeat" { Repeat },

      sym "@label" { Label },
      sym "@operator" { Operator },
      sym "@exception" { Exception },                      -- keywords related to exceptions (e.g. throw, catch)

      sym "@namespace" { PreProc },                        -- identifiers referring to modules and namespaces.
      sym "@annotation" { PreProc },                       -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
      sym "@attribute" { PreProc },                        -- Unstable
      sym "@include" { PreProc },                          -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

      sym "@type" { Type },                                -- type or class definitions and annotations
      sym "@type.builtin" { fg = M.orange, gui = italic }, -- built-in types

      sym "@comment" { Comment },                          -- line and block comments
      sym "@comment.documentation" { Comment },            -- comments documenting code
      sym "@comment.error" { fg = M.error },               -- error-type comments (e.g. ERROR, FIXME, DEPRECATED)
      sym "@comment.warning" { fg = M.yellow },            -- warning-type comments (e.g. WARNING, FIX, HACK)
      sym "@comment.todo" { fg = M.green },                -- todo-type comments (e.g. TODO, WIP)
      sym "@comment.note" { fg = M.lightblue },            -- note-type comments (e.g. NOTE, INFO, XXX)

      sym "@punctuation.bracket" { fg = M.fg },            -- brackets and parens.
      sym "@punctuation.delimiter" { Delimiter },          -- delimiters ie: `.`
      sym "@punctuation.special" { Delimiter },            -- special punctuation that does not fall in the categories before.

      sym "@tag" { Tag },                                  -- XML-style tag names (e.g. in XML, HTML, etc.)
      sym "@tag.attribute" { fg = M.yellow },              -- XML-style tag attribute
      sym "@tag.builtin" { Tag },                          -- XML-style tag names (e.g. HTML5 tags)
      sym "@tag.delimiter" { fg = M.white },               -- XML-style tag delimeters

      sym "@text" { fg = M.fg },
      sym "@text.emphasis" { fg = M.fg, gui = italic },
      sym "@text.literal" { String }, -- Literal text
      sym "@text.strike" { Comment, gui = underline },
      sym "@text.strong" { fg = M.fg, gui = bold },
      sym "@text.title" { fg = M.orange },               -- Text that is part of a title
      sym "@text.underline" { fg = M.fg, gui = underline },
      sym "@text.uri" { fg = M.green, gui = italic },    -- Any URI like a link or email

      sym "@diff.plus" { DiffAdd },                      -- added text (for diff files)
      sym "@diff.minus" { DiffDelete },                  -- deleted text (for diff files)
      sym "@diff.delta" { DiffChange },                  -- changed text (for diff files)

      sym "@markup.heading" { gui = bold },              -- headings, titles (including markers)
      sym "@markup.heading.1" { sym "@markup.heading" }, -- top-level heading
      sym "@markup.heading.2" { sym "@markup.heading" }, -- section heading
      sym "@markup.heading.3" { sym "@markup.heading" }, -- subsection heading
      sym "@markup.heading.4" { sym "@markup.heading" }, -- and so on
      sym "@markup.heading.5" { sym "@markup.heading" }, -- and so forth
      sym "@markup.heading.6" { sym "@markup.heading" }, -- six levels ought to be enough for anybody
      --
      -- sym "@markup.quote" {},                         -- block quotes
      -- sym "@markup.math" {},                          -- math environments (e.g. $ ... $ in LaTeX)
      --
      -- sym "@markup.link" {},                          -- text references, footnotes, citations, etc.
      -- sym "@markup.link.label" {},                    -- link, reference descriptions
      -- sym "@markup.link.url" {},                      -- URL-style links
      -- sym "@markup.raw" {},                           -- literal or verbatim text (e.g. inline code)
      -- sym "@markup.raw.block" {},                     -- literal or verbatim text as a stand-alone block
      -- sym "@markup.list" {},                          -- list markers
      -- sym "@markup.list.checked" {},                  -- checked todo-style list markers
      -- sym "@markup.list.unchecked" {},                -- unchecked todo-style list markers


      -- ╭─────────────────────────────────────────────────────────╮
      -- │                         Plugins                         │
      -- ╰─────────────────────────────────────────────────────────╯

      GitSignsAdd { fg = M.green },
      GitSignsChange { fg = M.grey },
      GitSignsDelete { fg = M.darkred },

      NeoTreeNormal { bg = M.sidebar },
      NeoTreeNormalNC { NeoTreeNormal },
      NeoTreeSignColumn { NeoTreeNormal },
      NeoTreeEndOfBuffer { fg = M.sidebar, bg = M.sidebar },
      NeoTreeStatusLine { NeoTreeEndOfBuffer },
      NeoTreeWinSeparator { fg = M.bg },
    }
  end
)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
